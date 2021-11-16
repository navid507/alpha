import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/periods_result.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

abstract class PeriodsApiInterface
{
  Future<PeriodsResult> getAllPeriods();

  Future<PeriodsResult> getRegisteredPeriods({required int userID});

  Future<APIResult> registerPeriod(
      {required String userToken,
        required String userID,
        required String periodID,
        required String discountCode,
        required String type});

  Future<APIResult> cancelPeriod(
      {required String userToken,
        required String userID,
        required String periodID});

  Future<APIResult> buyPeriod({
    /*required String userToken,*/
    required String userID,
    required String periodID,
    /*required String discountCode,*/
    /*required String type*/
  });

  Future<APIResult> getDiscount(
      {required String userToken,
        required String userID,
        // required String periodID,
        required String discountCode});
}