import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/periods/abstracts/periods_api_abstracts.dart';
import 'package:alpha/back/periods/abstracts/sessions_api_abstract.dart';
import 'package:alpha/back/periods/models/medical/medical.dart';
import 'package:alpha/back/periods/models/medical/medical_result.dart';
import 'package:alpha/back/periods/models/period/period_result.dart';
import 'package:alpha/back/periods/models/period/periods_result.dart';
import 'package:alpha/back/periods/models/period/registered_period.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/back/periods/models/session/sessions_result.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

import 'abstracts/periods_repo_abstracts.dart';
import 'models/period/period.dart';
import 'models/period/registered_period_result.dart';

enum PaymentType { Cash, Cart, Nothing, Online }

extension PaymentTypeValue on PaymentType {
  String get value {
    switch (this) {
      case PaymentType.Cash:
        return '0';
      case PaymentType.Cart:
        return '1';
      case PaymentType.Nothing:
        return '2';
      case PaymentType.Online:
        return '3';
    }
  }
}

class PeriodsRepo implements PeriodsRepoInterface {
  // initialization
  static PeriodsRepo? _instance;

  static PeriodsRepo getInstance(
      {required PeriodsApiInterface periodsApiInterface,
      required SessionsApiInterface sessionsApiInterface,
      required AccountingRepositoryInterface accountingRepositoryInterface}) {
    if (_instance == null) {
      _instance = PeriodsRepo._internal(
          periodsApi: periodsApiInterface,
          sessionsApi: sessionsApiInterface,
          accountingRepository: accountingRepositoryInterface);
    }

    return _instance!;
  }

  PeriodsRepo._internal(
      {required this.periodsApi,
      required this.sessionsApi,
      required this.accountingRepository});

  PeriodsApiInterface periodsApi;
  SessionsApiInterface sessionsApi;
  AccountingRepositoryInterface accountingRepository;

  // defining Controllers:
  final _allPeriodsStreamController = StreamController<List<Period>>();
  final _allRegisteredPeriodsStreamController =
      StreamController<List<Period>>();
  final _allPeriodsErrorStreamController = StreamController<String>();
  final _allRegisteredPeriodsErrorStreamController = StreamController<String>();

  final _registerPeriodSC = StreamController<String>();
  final _registerPeriodErrorSC = StreamController<String>();

  @override
  Stream<String> get registerPeriodStream => _registerPeriodSC.stream;

  @override
  Stream<String> get registerPeriodErrorStream => _registerPeriodErrorSC.stream;

  final _cancelPeriodSC = StreamController<String>();
  final _cancelPeriodErrorSC = StreamController<String>();

  @override
  Stream<String> get cancelPeriodStream => _cancelPeriodSC.stream;

  @override
  Stream<String> get cancelPeriodErrorStream => _cancelPeriodErrorSC.stream;

/*
  final _xxxSC = StreamController<String>();
  final _xxxErrorSC = StreamController<String>();

  @override
  Stream<String> get xxxStream =>
      _xxxSC.stream;
  @override
  Stream<String> get xxxErrorStream =>
      _xxxErrorSC.stream;
*/
// defining Streams:

  @override
  Stream<List<Period>> get allPeriodsStream =>
      _allPeriodsStreamController.stream;

  @override
  Stream<List<Period>> get allRegisteredPeriodsStream =>
      _allPeriodsStreamController.stream;

  @override
  Stream<String> get allPeriodsErrorStream =>
      _allPeriodsErrorStreamController.stream;

  @override
  Stream<String> get allRegisteredPeriodsErrorStream =>
      _allRegisteredPeriodsErrorStreamController.stream;

  bool _needUpdateAllPeriods = true;
  List<Period>? _allPeriods;

  bool _needUpdateRegisteredPeriods = true;
  List<Period>? _allRegisteredPeriods;

  // String _allPeriodsErrorMsg = '';
  // String _allRegisteredPeriodsErrorMsg = '';

  // buyPeriod
  final _buyPeriodSC = StreamController<String>();
  final _buyPeriodErrorSC = StreamController<String>();

  @override
  Stream<String> get buyPeriodStream => _buyPeriodSC.stream;

  @override
  Stream<String> get buyPeriodErrorStream => _buyPeriodErrorSC.stream;

  //discount

  final _discountSC = StreamController<int>();
  final _discountErrorSC = StreamController<String>();

  @override
  Stream<int> get discountStream => _discountSC.stream;

  @override
  Stream<String> get discountErrorStream => _discountErrorSC.stream;

  @override
  Future<PeriodsResult> getAllPeriods() {
    if (_allPeriods == null || !_needUpdateAllPeriods) {
      return getAllPeriodsFromServer();
    } else {
      _allPeriodsStreamController.sink.add(_allPeriods!);
      return Future<PeriodsResult>.value(PeriodsResult.success(_allPeriods!));
    }
  }

  Future<PeriodsResult> getAllPeriodsFromServer() async {
    var recentPeriods = await periodsApi.getAllPeriods();
    if (recentPeriods is SuccessPeriods) {
      _allPeriods = recentPeriods.periods;
      _allPeriodsStreamController.sink.add(_allPeriods!);
      _needUpdateAllPeriods = false;
    } else if (recentPeriods is ErrorPeriods) {
      _allPeriodsErrorStreamController.sink.add(recentPeriods.msg);
    }
    return recentPeriods;
  }

  @override
  Future<PeriodsResult> getAllRegisteredPeriods() {
    if (_allRegisteredPeriods == null || !_needUpdateRegisteredPeriods) {
      return getAllRegisteredPeriodsFromServer();
    } else {
      _allPeriodsStreamController.sink.add(_allPeriods!);
      return Future<PeriodsResult>.value(
          PeriodsResult.success(_allRegisteredPeriods!));
    }
  }

  Future<PeriodsResult> getAllRegisteredPeriodsFromServer() async {
    var recentRegisteredPeriods = await periodsApi.getRegisteredPeriods(
        userID: accountingRepository.userID);
    if (recentRegisteredPeriods is SuccessPeriods) {
      _allRegisteredPeriods = recentRegisteredPeriods.periods;
      _needUpdateRegisteredPeriods = false;
      _allRegisteredPeriodsStreamController.sink.add(_allRegisteredPeriods!);
    } else if (recentRegisteredPeriods is ErrorPeriods) {
      _allRegisteredPeriodsErrorStreamController.sink
          .add(recentRegisteredPeriods.msg);
    }
    return recentRegisteredPeriods;
  }

  @override
  Future<APIResult> registerPeriod(
      {required String periodID,
      String discountCode = '',
      required PaymentType typeID}) async {
    var userToken = await accountingRepository.token;
    var resultRegister = await periodsApi.registerPeriod(
        userToken: userToken,
        userID: accountingRepository.userID,
        periodID: periodID,
        discountCode: discountCode,
        type: typeID.value);
    if (resultRegister.isSuccess && typeID == PaymentType.Online) {
      _registerPeriodSC.sink.add(resultRegister.state.msg);
      _needUpdateRegisteredPeriods = true;
    } else {
      _registerPeriodErrorSC.sink.add(resultRegister.state.msg);
    }
    return resultRegister;
  }

  @override
  cancelPeriod({required String periodID}) async {
    var userToken = await accountingRepository.token;

    var resultCancel = await periodsApi.cancelPeriod(
        userToken: userToken,
        userID: accountingRepository.userID,
        periodID: periodID);
    if (resultCancel.isSuccess) {
      _cancelPeriodSC.sink.add(resultCancel.state.msg);
    } else {
      _cancelPeriodErrorSC.sink.add(resultCancel.state.msg);
    }
  }

  @override
  buyPeriod({required String periodID}) async {
    var resultBuy = await periodsApi.buyPeriod(
        userID: accountingRepository.userID, periodID: periodID);
    if (resultBuy.isSuccess) {
      _buyPeriodSC.sink.add(resultBuy.state.msg);
    } else {
      _buyPeriodErrorSC.sink.add(resultBuy.state.msg);
    }
  }

  @override
  getDiscount({required String discountCode}) async {
    var userToken = await accountingRepository.token;
    var resultDiscount = await periodsApi.getDiscount(
        userToken: userToken,
        userID: accountingRepository.userID,
        discountCode: discountCode);
    if (resultDiscount.isSuccess) {
      _discountSC.sink.add(resultDiscount.data);
    } else {
      _discountErrorSC.sink.add(resultDiscount.state.msg);
    }
  }

  // *******   End Of Periods APIs  *****************//

  // *******    Sessions APIs  *****************//

  // allSessions
  List<Session>? _allSessions;

  final _allSessionsSC = StreamController<List<Session>>();
  final _allSessionsErrorSC = StreamController<String>();

  @override
  Stream<List<Session>> get allSessionsStream => _allSessionsSC.stream;

  @override
  Stream<String> get allSessionsErrorStream => _allSessionsErrorSC.stream;

  @override
  Future<SessionsResult> getAllSessions() {
    // if (_allSessions == null) {
    if (_activePeriod != null) {
      return _getAllSessionsFromServer(
          periodID: _activePeriod!.registerPeriodId);
    } else {
      return Future<SessionsResult>.value(
          SessionsResult.error(1, "no Active Period"));
    }
    // } else {
    //   _allSessionsSC.sink.add(_allSessions!);
    //   return Future<SessionsResult>.value(
    //       SessionsResult.success(_allSessions!));
    // }
  }

  Future<SessionsResult> _getAllSessionsFromServer(
      {required String periodID}) async {
    var userToken = await accountingRepository.token;
    var allSessions =
        await sessionsApi.getAllSessions(periodID: periodID, token: userToken);
    if (allSessions is SuccessSessions) {
      _allSessions = allSessions.sessions;
      _allSessionsSC.sink.add(_allSessions!);
    } else if (allSessions is ErrorSessions) {
      _allMedicalErrorSC.sink.add(allSessions.msg);
    }
    return allSessions;
  }

  // allMedical
  List<Medical>? _allMedical;

  final _allMedicalSC = StreamController<List<Medical>>();
  final _allMedicalErrorSC = StreamController<String>();

  @override
  Stream<List<Medical>> get allMedicalStream => _allMedicalSC.stream;

  @override
  Stream<String> get allMedicalErrorStream => _allMedicalErrorSC.stream;

  @override
  Future<MedicalsResult> getAllMedicals() {
    if (_allMedical == null) {
      return _getAllMedicalsServer();
    } else {
      _allMedicalSC.sink.add(_allMedical!);
      return Future<MedicalsResult>.value(MedicalsResult.success(_allMedical!));
    }
  }

  Future<MedicalsResult> _getAllMedicalsServer() async {
    var userToken = await accountingRepository.token;
    var allMedicals = await sessionsApi.getAllMedicals(
        userID: accountingRepository.userID, token: userToken);
    if (allMedicals is SuccessMedicals) {
      _allMedical = allMedicals.medicalsSessions;
      _allMedicalSC.sink.add(_allMedical!);
    } else if (allMedicals is ErrorMedicals) {
      _allMedicalErrorSC.sink.add(allMedicals.msg);
    }
    return allMedicals;
  }

  // sessionScore

  final _sessionScoreSC = StreamController<String>();
  final _sessionScoreErrorSC = StreamController<String>();

  @override
  Stream<String> get sessionScoreStream => _sessionScoreSC.stream;

  @override
  Stream<String> get sessionScoreErrorStream => _sessionScoreErrorSC.stream;

  @override
  Future<StateResult> setSessionScore(
      {required String sessionID,
      required String score,
      required String comment}) async {
    var userToken = await accountingRepository.token;
    var resultSet = await sessionsApi.setSessionScore(
        sessionID: sessionID, score: score, comment: comment, token: userToken);

    if (resultSet.isSuccess) {
      _buyPeriodSC.sink.add(resultSet.msg);
      _allSessions = null;
    } else {
      _buyPeriodErrorSC.sink.add(resultSet.msg);
    }
    return resultSet;
  }

  // periodDetails

  RegisteredPeriod? _activePeriod;
  final _activePeriodSC = StreamController<RegisteredPeriod>();
  final _activePeriodErrorSC = StreamController<String>();

  @override
  Stream<RegisteredPeriod> get activePeriodStream => _activePeriodSC.stream;

  @override
  Stream<String> get activePeriodErrorStream => _activePeriodErrorSC.stream;

  @override
  Future<RegisteredPeriodResult> getActivePeriod() {
    // if (_activePeriod == null) {
    return getActivePeriodFromServer();
    // } else {
    //   _activePeriodSC.sink.add(_activePeriod!);
    //   return Future<RegisteredPeriodResult>.value(RegisteredPeriodResult.success(_activePeriod!));
    // }
  }

  Future<RegisteredPeriodResult> getActivePeriodFromServer() async {
    var userToken = await accountingRepository.token;
    var periodDetails = await sessionsApi.getActivePeriodDetails(
        userID: accountingRepository.userID, token: userToken);
    if (periodDetails is SuccessRegisteredPeriod) {
      _activePeriod = periodDetails.period;
      _activePeriodSC.sink.add(_activePeriod!);
    } else if (periodDetails is ErrorRegisteredPeriod) {
      _activePeriodErrorSC.sink.add(periodDetails.msg);
    }
    return periodDetails;
  }

  disposeAll() {
    _allPeriodsErrorStreamController.close();
    _allPeriodsStreamController.close();
    _allRegisteredPeriodsStreamController.close();
    _allRegisteredPeriodsErrorStreamController.close();
    _registerPeriodErrorSC.close();
    _registerPeriodSC.close();
    _cancelPeriodErrorSC.close();
    _cancelPeriodSC.close();
    _buyPeriodSC.close();
    _buyPeriodErrorSC.close();
    _discountSC.close();
    _discountErrorSC.close();
  }
}
