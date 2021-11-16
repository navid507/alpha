import 'package:alpha/back/periods/models/medical/medical_result.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/period_result.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/back/periods/models/session/sessions_result.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

abstract class SessionsApiInterface {
  Future<SessionsResult> getAllSessions(
      {required String periodID, required String token});

  Future<PeriodResult> getPeriodDetails(
      {required String userID, required String token});

  Future<MedicalsResult> getAllMedicals(
      {required String userID, required String token});

  Future<StateResult> setSessionScore(
      {required String sessionID,
      required int score,
      required String comment,
      required String token});
}
