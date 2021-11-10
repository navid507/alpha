

import 'package:alpha/back/accounting/abstracts/accounting_api_abstract.dart';
import 'package:alpha/back/accounting/accounting_api.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:http/testing.dart';
import 'dart:convert';
// class MockClient extends Mock implements http.Client{
//
// }

import 'package:http/http.dart' as http;
void main()
{
  late AccountingApiInterface accountingApi;// 
  setUp(()  {
    accountingApi = AccountingAPI(http: HttpCalls(httpClient: http.Client()));

  } );
  test('test if phone checked in register phone', () async {
    var res = await accountingApi.registerPhone(phone: "", uid: "testFromMacFlutter");
    expect(res.error, equals(1));

  });
  test('test if unique checked in register phone', () async {
    var res = await accountingApi.verifyPhone(phone: "", uid: "testFromMacFlutter", code: "");
    expect(res.state.error, equals(1));

  });

  test('test if unique checked in verify code', () async {
    var res = await accountingApi.verifyPhone(phone: "0936674", uid: "", code: "");
    expect(res.state.error, equals(2));

  });
  test('test if phone checked in verify code', () async {
    var res = await accountingApi.verifyPhone(phone: "0936674", uid: "testFromMacFlutter", code: "");
    expect(res.state.error, equals(3));

  });


  // complete registration and verify
  test('test if register phone is of', () async {
    var res = await accountingApi.registerPhone(phone: "09366", uid: "testFromMacFlutter");
    expect(res.error, equals(0));

  });

  test('test if verify code is ok ', () async {
    var res = await accountingApi.verifyPhone(phone: "09366", uid: "testFromMacFlutter", code: "7600");
    expect(res.state.error, equals(3));
  });


  // test('test if code checked in verify code', () async {
  //   var res = await accountingApi.registerPhone(phone: "0936674", uid: "");
  //   expect(res.error, equals(2));
  //
  // });



  // test('test create result ', () async {
  //   // var client = MockClient((request) async {
  //   //   return Response('''{"state":{"error":1,"msg":"کد وارد شده اشتباه است"}}''', 200);
  //   //
  //   // });
  //
  //   APIResult result = APIResult(state: StateResult(msg: 'invalid code', error: 1));
  //
  //   var client = MockClient((request) async {
  //     return Response(json.encode(result), 200);
  //
  //   });
  //
  //   // var response = await client.post(Uri.http('example.com', '/foo'),
  //   //     body: {'field1': 'value1', 'field2': 'value2'});
  //
  //   var res = await client.get(Uri.parse(AccountingURLs.RegisterPhone));
  //   print(res.body);
  //
  //
  //   expect(1, equals(1));
  //
  // });

}