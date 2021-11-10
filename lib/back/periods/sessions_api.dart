import 'package:alpha/back/periods/abstracts/sessions_api_abstract.dart';
import 'package:alpha/back/periods/models/period.dart';
import 'package:alpha/main_functions/http_functions.dart';

import 'models/session.dart';

class SessionsURLs {
  static const String _root = "http://orkaswim.ir/index.php/alpha_api/session";
  static const String AllSessions = "$_root/sessions";
  static const String RegisteredPeriods = "$_root/periods";
  static const String RegisterPeriod = "$_root/register";
  static const String CancelPeriod = "$_root/cancel";
  static const String BuyPeriod = "$_root/buy";
  static const String Discount = "$_root/discounts";

// Profile
}

class SessionApi implements SessionsApiInterface {
  HttpFunctionsInterface http;

  SessionApi({required this.http});

  @override
  Future<List<Session>> getAllSessions({required String periodID}) async {
    List<Session> sessions = List.empty(growable: true);

    var res = await http.get(url: SessionsURLs.AllSessions);

    int err = res.state.error;
    if (err != 0) return sessions;

    List<dynamic> swimmersJson = res.data;
    swimmersJson.forEach((element) {
      sessions.add(Session.fromJson(element));
    });

    return sessions;
  }



}
