import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_api_abstract.dart';
import 'package:alpha/back/accounting/accounting_api.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/accounting/models/user_access_data.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:http/http.dart' as http;

import 'abstracts/accounting_repo_abstract.dart';

class AccountingRepo implements AccountingRepositoryInterface {
  // Initilization
  static AccountingRepo? _instance;
  UserStoredData userStoredData;
  AccountingApiInterface accountingApi;

  static AccountingRepo getInstance() {
    if (_instance == null) {
      _instance = AccountingRepo._internal(
          userStoredData: UserStoredData(),
          accountingApi:
          AccountingAPI(http: HttpCalls(httpClient: http.Client())));
    }

    return _instance!;
  }

  AccountingRepo._internal(
      {required this.userStoredData, required this.accountingApi});

  String? get _userToken {
    var token = userStoredData.getUserToken();
    if (token == null) {
      changeUserStateToNothing();
    }
    return token;
  }

  changeUserStateToNothing() {
    userStoredData.setRegisterState(RegisterState.Nothing);
    updateRegisterState();
  }

  Swimmer? _activeSwimmer;
  List<Swimmer>? _relativeSwimmers;
  RegisterState _registerState = RegisterState.Nothing;

  // defining Controllers
  final _activeSwimmerController = StreamController<Swimmer>();
  final _relativeSwimmersController = StreamController<List<Swimmer>>();

  final _registerStateController = StreamController<RegisterState>();

  // get Stream of Controllers
  Stream<Swimmer> get activeSwimmerStream => _activeSwimmerController.stream;

  Stream<List<Swimmer>> get relativeSwimmersStream =>
      _relativeSwimmersController.stream;

  Stream<RegisterState> get registerStateStream =>
      _registerStateController.stream;

  updateRegisterState() {
    _registerState = userStoredData.getRegisterState();
    _registerStateController.sink.add(_registerState);
  }

  @override
  getRegisterState() {
    updateRegisterState();
  }

  String? lastPhone; // for registering the phone

  @override
  Future<StateResult> registerPhone(String phone) async {
    String? uid = await userStoredData.getDeviceUniqueID();

    lastPhone = phone;
    var res = await accountingApi.registerPhone(phone: phone, uid: uid);
    if (res.error != 0) {
      userStoredData.setRegisterState(RegisterState.Nothing);
    } else {
      userStoredData.setRegisterState(RegisterState.Phone);
    }

    return res;
  }

  @override
  Future<StateResult> verifyPhone(String code) async {
    String? uid = await userStoredData.getDeviceUniqueID();
    if (lastPhone == null) {
      userStoredData.setRegisterState(RegisterState.Nothing);
      return StateResult(msg: 'no phone found', error: 11);
    }

    var res = await accountingApi.verifyPhone(
        phone: lastPhone!, code: code, uid: uid);
    if (res.state.error == 0) {
      if (res.data != null) {
        var accessData = UserAccessData.fromJson(res.data);
        userStoredData.setUserToken(accessData.token);
        userStoredData.setDeviceID(accessData.deviceID);
        userStoredData.setRegisterState(RegisterState.OK);
        updateRegisterState();
      }
    }

    return res.state;
  }

  @override
  updateActiveSwimmer() async {
    await updateRelatedSwimmers();
    if (_activeSwimmer != null) {
      _activeSwimmerController.sink.add(_activeSwimmer!);
    }
  }

  @override
  updateRelatedSwimmers() async {
    if (_relativeSwimmers != null) {
      _relativeSwimmersController.sink.add(_relativeSwimmers!);
    } else {
      var token = _userToken;
      if (token != null) {
        _relativeSwimmers =
        await accountingApi.findRelativeSwimmers(private: token);
        setInitialActiveSwimmer();
      }
    }
  }

  setInitialActiveSwimmer() {
    var rs = _relativeSwimmers;
    if (rs != null) {
      var activeUserID = userStoredData.getActiveUser();
      var activeSwimmer = rs.firstWhere((element) => element.id == activeUserID,
          orElse: () => rs[0]);

      changeActiveSwimmer(activeSwimmer);
    }
  }

  changeActiveSwimmer(Swimmer activeSwimmer) {
    userStoredData.setActiveUser(activeSwimmer.id);
    _activeSwimmer = activeSwimmer;
    _activeSwimmerController.sink.add(activeSwimmer);
  }

  Future<StateResult> insertSwimmer(Swimmer swimmer,
      Map<String, String> files) async {
    var result =
    await accountingApi.registerUser(swimmer: swimmer, files: files);
    updateRelatedSwimmers();

    return result.state;
  }

  @override
  String get token => _userToken ?? "";

  @override
  int get userID => _activeSwimmer?.id ?? -1;
}
