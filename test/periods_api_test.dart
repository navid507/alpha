import 'package:alpha/back/periods/abstracts/periods_api_abstracts.dart';
import 'package:alpha/back/periods/models/period/periods_result.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/public_repo/abstracts/public_api_abstracts.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;

void main() {
  const PRiVATE = '614ac2e6cdcf4417afcb3c564c2af5fe';
  const DEVICEiD = '1784';
  const USERiD = '430';
  late PeriodsApiInterface periodsApi; //
  setUp(() {
    periodsApi = PeriodsApi(http: HttpCalls(httpClient: http.Client()));
  });
  test('is get all periods ok', () async {
    var res = await periodsApi.getAllPeriods();
    if (res is SuccessPeriods) {
      expect(res.periods.length, greaterThanOrEqualTo(1));
    } else {
      fail('problem in get all periods');
    }
  });

  test('is get registered periods ok', () async {
    var res = await periodsApi.getRegisteredPeriods(userID: 16);
    if (res is SuccessPeriods) {
      expect(res.periods.length, greaterThan(1));
    } else {
      fail('problem in get registered periods');
    }
  });

  test('is register period ok', () async {
    var res = await periodsApi.registerPeriod(
        userToken: PRiVATE,
        userID: USERiD,
        periodID: "1",
        discountCode: "no",
        type: "1");
    expect(res.state.error, equals(0));
  });

  test('is discount ok', () async {
    var res = await periodsApi.getDiscount(
      userToken: PRiVATE,
      userID: USERiD,
      discountCode: "no",
    );
    expect(res.data, equals(0));
  });

  // "private" -> ""

  // test('is get top swimmers ok', () async {
  //   var res = await publicApi.getTopSwimmers();
  //   expect(res!.topSwimmers!.length, greaterThan(1));
  //
  // });
  //
  // test('is get images ok', () async {
  //   var res = await publicApi.getGallery();
  //   expect(res!.length, greaterThan(1));
  //
  // });
}
