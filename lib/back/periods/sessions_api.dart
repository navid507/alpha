import 'package:alpha/back/periods/abstracts/sessions_api_abstract.dart';
import 'package:alpha/back/periods/models/medical/medical.dart';
import 'package:alpha/back/periods/models/medical/medical_result.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/session/sessions_result.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

import 'models/period/period_result.dart';
import 'models/session/session.dart';

class SessionsURLs {
  static const String _root = "http://orkaswim.ir/index.php/alpha_api/session";
  static const String AllSessions = "$_root/sessions";
  static const String PeriodDetails = "$_root/overview";
  static const String AllMedicalSession = "$_root/medical";
  static const String SetScore = "$_root/reg_score";
}

class SessionApi implements SessionsApiInterface {
  HttpFunctionsInterface http;

  SessionApi({required this.http});

  @override
  Future<SessionsResult> getAllSessions(
      {required String periodID, required String token}) async {
    List<Session> sessions = List.empty(growable: true);

    var res =
        await http.get(url: "${SessionsURLs.AllSessions}/$periodID/$token");

    // int err = res.state.error;
    // if (err != 0) return sessions;

    if (res.isSuccess) {
      List<dynamic> swimmersJson = res.data;
      swimmersJson.forEach((element) {
        sessions.add(Session.fromJson(element));
      });

      return SessionsResult.success(sessions);
    }
    return SessionsResult.error(res.state.error, res.state.msg);
  }

  @override
  Future<PeriodResult> getPeriodDetails(
      {required String userID, required String token}) async {
    var res =
        await http.get(url: "${SessionsURLs.PeriodDetails}/$userID/$token");
    if (res.isSuccess) {
      PeriodResult pr = PeriodResult.success(Period.fromJson(res.data));
      return pr;
    }

    return PeriodResult.error(res.state.error, res.state.msg);
  }

  @override
  Future<MedicalsResult> getAllMedicals(
      {required String userID, required String token}) async {
    List<Medical> sessions = List.empty(growable: true);

    var res =
        await http.get(url: "${SessionsURLs.AllMedicalSession}/$userID/$token");

    if (res.isSuccess) {
      List<dynamic> swimmersJson = res.data;
      swimmersJson.forEach((element) {
        sessions.add(Medical.fromJson(element));
      });

      return MedicalsResult.success(sessions);
    }
    return MedicalsResult.error(res.state.error, res.state.msg);
  }

  @override
  Future<StateResult> setSessionScore(
      {required String sessionID,
      required int score,
      required String comment,
      required String token}) async {
    List<Medical> sessions = List.empty(growable: true);
    var body = Map<String, dynamic>();
    body['session'] = sessionID;
    body['score'] = score;
    body['comment'] = comment;
    body['private'] = token;

    var res = await http.post(url: SessionsURLs.SetScore, body: body);

    return res.state;
  }



}
