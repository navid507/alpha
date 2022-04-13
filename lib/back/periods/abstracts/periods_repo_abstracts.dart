import 'package:alpha/back/periods/models/medical/medical.dart';
import 'package:alpha/back/periods/models/medical/medical_result.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/periods_result.dart';
import 'package:alpha/back/periods/models/period/registered_period.dart';
import 'package:alpha/back/periods/models/period/registered_period_result.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/back/periods/models/session/sessions_result.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

import '../periods_repo.dart';

abstract class PeriodsRepoInterface {
  Stream<List<Period>> get allPeriodsStream;

  Stream<List<Period>> get allRegisteredPeriodsStream;

  Stream<String> get allPeriodsErrorStream;

  Stream<String> get allRegisteredPeriodsErrorStream;

  Stream<String> get buyPeriodStream;

  Stream<String> get buyPeriodErrorStream;

  Stream<int> get discountStream;

  Stream<String> get discountErrorStream;

  Stream<String> get registerPeriodStream;

  Stream<String> get registerPeriodErrorStream;

  Stream<String> get cancelPeriodStream;

  Stream<String> get cancelPeriodErrorStream;

  Stream<List<Session>> get allSessionsStream;

  Stream<String> get allSessionsErrorStream;

  Stream<List<Medical>> get allMedicalStream;

  Stream<String> get allMedicalErrorStream;

  Stream<String> get sessionScoreStream;

  Stream<String> get sessionScoreErrorStream;

  Stream<RegisteredPeriod> get activePeriodStream;

  Stream<String> get activePeriodErrorStream;

  Future<PeriodsResult> getAllPeriods();

  Future<PeriodsResult> getAllRegisteredPeriods();

  Future<APIResult> registerPeriod(
      {required String periodID,
      String discountCode = '',
      required PaymentType typeID});

  cancelPeriod({required String periodID});

  getDiscount({required String discountCode});

  buyPeriod({required String periodID});

  Future<MedicalsResult> getAllMedicals();

  Future<SessionsResult> getAllSessions();

  Future<StateResult> setSessionScore(
      {required String sessionID,
      required String score,
      required String comment});

  Future<RegisteredPeriodResult> getActivePeriod();
}
