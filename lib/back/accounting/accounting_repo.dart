import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_api_abstract.dart';
import 'package:alpha/back/accounting/accounting_api.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmers_result.dart';
import 'package:alpha/back/accounting/models/user_access_data.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../global_constants.dart';
import 'abstracts/accounting_repo_abstract.dart';
import 'models/record/record_result.dart';
import 'models/record/record_type.dart';

class AccountingRepo implements AccountingRepositoryInterface {
  // Initilization
  static AccountingRepo? _instance;
  UserStoredData userStoredData;
  AccountingApiInterface accountingApi;

  static AccountingRepo getInstance({required UserStoredData userStoredData}) {
    _instance ??= AccountingRepo._internal(
        userStoredData: userStoredData,
        accountingApi:
            AccountingAPI(http: HttpCalls(httpClient: http.Client())));

    return _instance!;
  }

  AccountingRepo._internal(
      {required this.userStoredData, required this.accountingApi});

  Future<String?> get _userToken async {
    var token = await userStoredData.getUserToken();
    if (token == null) {
      changeUserStateToNothing();
    }
    return token;
  }

  changeUserStateToNothing() {
    changeRegisterState(RegisterState.Nothing);
  }

  Swimmer? _activeSwimmer;
  List<Swimmer>? _relativeSwimmers;
  RegisterState _registerState = RegisterState.Nothing;

  // defining Controllers
  final _activeSwimmerController = StreamController<Swimmer>.broadcast();
  final _relativeSwimmersController = StreamController<List<Swimmer>>();

  final _registerStateController = StreamController<RegisterState>.broadcast();

  @override
  dispose() {
    _activeSwimmerController.close();
    _relativeSwimmersController.close();
    _registerStateController.close();
  }

  // get Stream of Controllers
  Stream<Swimmer> get activeSwimmerStream =>
      _activeSwimmerController.stream.asBroadcastStream();

  Stream<List<Swimmer>> get relativeSwimmersStream =>
      _relativeSwimmersController.stream;

  @override
  Stream<RegisterState> get registerStateStream =>
      _registerStateController.stream.asBroadcastStream();

  updateRegisterState() async {
    _registerState = await userStoredData.getRegisterState();
    _registerStateController.sink.add(_registerState);
  }

  @override
  resetRegisterState() async {
    changeRegisterState(RegisterState.Nothing);
    // _registerStateController.sink.add(_registerState);
  }

  @override
  Future<RegisterState> getRegisterState() async {
    await updateRegisterState();
    return _registerState;
  }

  String? lastPhone; // for registering the phone

  @override
  Future<StateResult> registerPhone(String phone) async {
    String? uid = await userStoredData.getDeviceUniqueID();
    String? device_name = await userStoredData.getDeviceName();
    lastPhone = phone;
    var res = await accountingApi.registerPhone(phone: phone, uid: uid!, device_name: device_name!,);
    if (res.isSuccess) {
      changeRegisterState(RegisterState.Phone);
    } else {
      changeRegisterState(RegisterState.Nothing);
    }

    return res;
  }

  @override
  Future<StateResult> verifyPhone(String code) async {
    String? uid = await userStoredData.getDeviceUniqueID();
    if (lastPhone == null) {
      changeRegisterState(RegisterState.Nothing);
      return StateResult(msg: 'no phone found', error: 11);
    }
    var res = await accountingApi.verifyPhone(
        phone: lastPhone!, code: code, uid: uid ?? "12");
    if (res.isSuccess) {
      if (res.data != null) {
        var accessData = UserAccessData.fromJson(res.data);
        userStoredData.setUserToken(accessData.token);
        userStoredData.setDeviceID(accessData.deviceID);
        changeRegisterState(RegisterState.OK);
      }
    }
    updateFirebaseToken();
    return res.state;
  }

  changeRegisterState(RegisterState state) {
    _registerState = state;
    userStoredData.setRegisterState(_registerState);
    updateRegisterState();
  }

  @override
  updateFirebaseToken() async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    var token = await _userToken;

    if (token != null) {
      var firebaseToken = await _firebaseMessaging.getToken();

      if (firebaseToken != null) {
        accountingApi.updateToken(token: token, firebaseToken: firebaseToken);
      } else {
        _firebaseMessaging.onTokenRefresh.listen((firebaseToken) {
          accountingApi.updateToken(token: token, firebaseToken: firebaseToken);
        });
      }
    }
  }

  @override
  updateActiveSwimmer() async {
    await updateRelatedSwimmers();
    if (_activeSwimmer != null) {
      _activeSwimmerController.sink.add(_activeSwimmer!);
    }
  }

  @override
  Future<List<Swimmer>?> updateRelatedSwimmers() async {
    if (_relativeSwimmers != null) {
      _relativeSwimmersController.sink.add(_relativeSwimmers!);
      return Future<List<Swimmer>>.value(_relativeSwimmers);
    } else {
      var token = await _userToken;
      if (token != null) {
        var result = await accountingApi.findRelativeSwimmers(private: token);
        if (result is SuccessSwimmers) {
          _relativeSwimmers = result.swimmers;
          await setInitialActiveSwimmer();
          return _relativeSwimmers;
        }
      }
    }
  }

  setInitialActiveSwimmer() async {
    var rs = _relativeSwimmers;
    if (rs != null) {
      var activeUserID = await userStoredData.getActiveUser();
      if (activeUserID != null) {
        var activeSwimmer = rs.firstWhere(
            (element) => element.id == activeUserID,
            orElse: () => rs[0]);
        changeActiveSwimmer(activeSwimmer);
      } else {
        // _relativeSwimmers![0].isActive = true;
        changeActiveSwimmer(_relativeSwimmers![0]);
      }
    }
  }

  @override
  changeActiveSwimmer(Swimmer activeSwimmer) {
    userStoredData.setActiveUser(activeSwimmer.id);
    _activeSwimmer = activeSwimmer;
    _activeSwimmerController.sink.add(activeSwimmer);

    _relativeSwimmers!.forEach((swimmer) {
      swimmer.isActive = (swimmer.id == activeSwimmer.id);
    });
  }

  @override
  Future<StateResult> addSwimmer(Swimmer swimmer) async {
    var result = await accountingApi.registerUser(swimmer: swimmer);
    if ((result.isSuccess)) {
      _relativeSwimmers = null;
      updateRelatedSwimmers();
    }
    return result.state;
  }

  @override
  Future<StateResult> editSwimmer(Swimmer swimmer) async {
    var tempToken = await _userToken;
    var result = await accountingApi.editUser(
        swimmer: swimmer, userToken: tempToken ?? "");
    if ((result.isSuccess)) {
      _relativeSwimmers = null;
      _activeSwimmer = null;
      updateRelatedSwimmers();
    }

    return result.state;
  }

  @override
  Future<String> get token async {
    var tempToken = await _userToken;
    return (tempToken != null) ? tempToken : "";
  }

  @override
  int get userID => _activeSwimmer?.id ?? -1;

  @override
  Future<Swimmer?> getActiveSwimmer() async {
    if (_activeSwimmer != null) {
      return Future<Swimmer?>.value(_activeSwimmer);
    } else {
      await updateRelatedSwimmers();
      return Future<Swimmer?>.value(_activeSwimmer);
    }
  }

  @override
  Future<RecordsResult> getAllRecordsOf(RecordType recordType) async {
    var tempToken = await _userToken;
    if (tempToken != null) {
      if (_activeSwimmer != null) {
        var allRecords = await accountingApi.getRecordOfUser(
            _activeSwimmer!.sid, recordType.id, tempToken);
        return allRecords;
      } else {
        return RecordsResult.error(1, "no active user set");
      }
    } else {
      return RecordsResult.error(2, "no token set");
    }
  }
}
