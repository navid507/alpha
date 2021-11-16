import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

import 'abstracts/periods_api_abstracts.dart';
import 'models/period/periods_result.dart';

class PeriodsURLs {
  static const String _root = "http://orkaswim.ir/index.php/alpha_api/period";
  static const String AllPeriods = "$_root/get";
  static const String RegisteredPeriods = "$_root/periods";
  static const String RegisterPeriod = "$_root/register";
  static const String CancelPeriod = "$_root/cancel";
  static const String BuyPeriod = "$_root/buy";
  static const String Discount = "$_root/discounts";

// Profile
}

class PeriodsApi implements PeriodsApiInterface {
  HttpFunctionsInterface http;

  PeriodsApi({required this.http});

  @override
  Future<PeriodsResult> getAllPeriods() async {

    var res = await http.get(url: PeriodsURLs.AllPeriods);

    if (res.isSuccess) {
      List<Period> periods = List.empty(growable: true);
      List<dynamic> periodsJson = res.data;
      periodsJson.forEach((element) {
        periods.add(Period.fromJson(element));
      });
      return PeriodsResult.success(periods);
    } else {
      return PeriodsResult.error(res.state.error, res.state.msg);
    }
  }

  @override
  Future<PeriodsResult> getRegisteredPeriods({required int userID}) async {
    var res = await http.get(url: "${PeriodsURLs.RegisteredPeriods}/$userID");

    if (res.isSuccess) {
      List<Period> periods = List.empty(growable: true);
      List<dynamic> periodsJson = res.data;
      periodsJson.forEach((element) {
        periods.add(Period.fromJson(element));
      });
      return PeriodsResult.success(periods);
    } else {
      return PeriodsResult.error(res.state.error, res.state.msg);
    }
  }

  Future<APIResult> registerPeriod(
      {required String userToken,
      required String userID,
      required String periodID,
      required String discountCode,
      required String type}) async {
    Map<String, dynamic> body = Map();
    body['private'] = userToken;
    body['user'] = userID;
    body['period'] = periodID;
    body['type'] = type;
    body['code'] = discountCode;

    var res = await http.post(url: PeriodsURLs.RegisterPeriod, body: body);

    return res;
  }

  Future<APIResult> cancelPeriod(
      {required String userToken,
      required String userID,
      required String periodID}) async {
    Map<String, dynamic> body = Map();
    body['private'] = userToken;
    body['user'] = userID;
    body['period'] = periodID;

    var res = await http.post(url: PeriodsURLs.CancelPeriod, body: body);

    return res;
  }

  // using this api you ask a buy url from server
  Future<APIResult> buyPeriod({
    /*required String userToken,*/
    required String userID,
    required String periodID,
    /*required String discountCode,*/
    /*required String type*/
  }) async {
    Map<String, dynamic> body = Map();
    // body['private'] = userToken;
    body['user'] = userID;
    body['period'] = periodID;
    // body['type'] = type;
    // body['code'] = discountCode;

    var res = await http.post(url: PeriodsURLs.BuyPeriod, body: body);

    return res;
  }

  Future<APIResult> getDiscount(
      {required String userToken,
      required String userID,
      // required String periodID,
      required String discountCode}) async {
    Map<String, dynamic> body = Map();
    body['private'] = userToken;
    body['user'] = userID;
    // body['period'] = periodID;
    // body['type'] = type;
    body['code'] = discountCode;

    var res = await http.post(url: PeriodsURLs.Discount, body: body);

    return res;
  }
}
