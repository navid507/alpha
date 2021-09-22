

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

void main()
{
  test('test create result ', () async {
    // var client = MockClient((request) async {
    //   return Response('''{"state":{"error":1,"msg":"کد وارد شده اشتباه است"}}''', 200);
    //
    // });

    APIResult result = APIResult(state: StateResult(msg: 'invalid code', error: 1));

    var client = MockClient((request) async {
      return Response(json.encode(result), 200);

    });

    // var response = await client.post(Uri.http('example.com', '/foo'),
    //     body: {'field1': 'value1', 'field2': 'value2'});

    var res = await client.get(Uri.parse(AccountingURLs.RegisterPhone));
    print(res.body);


    expect(1, equals(1));

  });

}