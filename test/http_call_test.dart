import 'package:alpha/back/accounting/accounting_api.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
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

void main() {
  test('test get api of http calls ', () async {
    APIResult result =
        APIResult(state: StateResult(msg: 'invalid code', error: 1));

    var client = MockClient((request) async {
      return Response(json.encode(result), 200);
    });

    var res = await client.get(Uri.parse(AccountingURLs.RegisterPhone));
    print('input is ${res.body}');

    HttpCalls httpCalls = HttpCalls(httpClient: client);
    var res1 = await httpCalls.get(url: AccountingURLs.RegisterPhone);

    expect(res1.state.error, equals(result.state.error));
    expect(res1.state.msg, equals(result.state.msg));
  });
  test('test post api of http calls ', () async {
    APIResult result =
        APIResult(state: StateResult(msg: 'invalid code', error: 1));

    var client = MockClient((request) async {
      return Response(json.encode(result), 200);
    });

    var res = await client.post(
      Uri.parse(AccountingURLs.RegisterPhone),
      body: json.encode({'name': 'navid', 'id': 100}),
      headers: {'Content-Type': 'application/json'},
    );
    print(res.body);

    HttpCalls httpCalls = HttpCalls(httpClient: client);
    var res1 = await httpCalls
        .post(url: AccountingURLs.RegisterPhone, body: {'name': 'navid', 'id': 100});

    expect(res1.state.error, equals(result.state.error));
    expect(res1.state.msg, equals(result.state.msg));
  });

  test('test post api of http calls for return swimmers ', () async {
    Swimmer swimmer = Swimmer(id: 1, code: '2345', phone: 'phone', firstName: 'firstName', lastName: 'lastName', birthDate: 'birthDate', homeAddress: 'homeAddress', homePhone: 'homePhone', schoolAddress: 'schoolAddress', schoolPhone: 'schoolPhone', schoolRegion: 'schoolRegion', fatherEducation: 'fatherEducation', fatherJob: 'fatherJob', fatherPhone: 'fatherPhone', motherEducation: 'motherEducation', motherJob: 'motherJob', motherPhone: 'motherPhone', useService: 'useService', score: 'score', reagent: 'reagent', image: 'image', nationalImage: 'nationalImage', shenasImage: 'shenasImage', insuranceImage: 'insuranceImage', eshtegalImage: 'eshtegalImage', introduction: 'introduction');
    APIResult result =
    APIResult(state: StateResult(msg: 'success', error: 0), data: [swimmer, swimmer]);

    var client = MockClient((request) async {
      return Response(json.encode(result), 200);
    });

    var res = await client.post(
      Uri.parse(AccountingURLs.RegisterPhone),
      body: json.encode({'name': 'navid', 'id': 100}),
      headers: {'Content-Type': 'application/json'},
    );
    print(res.body);

    HttpCalls httpCalls = HttpCalls(httpClient: client);
    var res1 = await httpCalls
        .post(url: AccountingURLs.RegisterPhone, body: {'name': 'navid', 'id': 100});

    expect(res1.state.error, equals(result.state.error));
    expect(res1.state.msg, equals(result.state.msg));



  });

  test('test post api of http calls for return swimmer ', () async {
    Swimmer swimmer = Swimmer(id: 1, code: '2345', phone: 'phone', firstName: 'firstName', lastName: 'lastName', birthDate: 'birthDate', homeAddress: 'homeAddress', homePhone: 'homePhone', schoolAddress: 'schoolAddress', schoolPhone: 'schoolPhone', schoolRegion: 'schoolRegion', fatherEducation: 'fatherEducation', fatherJob: 'fatherJob', fatherPhone: 'fatherPhone', motherEducation: 'motherEducation', motherJob: 'motherJob', motherPhone: 'motherPhone', useService: 'useService', score: 'score', reagent: 'reagent', image: 'image', nationalImage: 'nationalImage', shenasImage: 'shenasImage', insuranceImage: 'insuranceImage', eshtegalImage: 'eshtegalImage', introduction: 'introduction');
    APIResult result =
    APIResult(state: StateResult(msg: 'success', error: 0), data: swimmer);

    var client = MockClient((request) async {
      return Response(json.encode(result), 200);
    });

    var res = await client.post(
      Uri.parse(AccountingURLs.RegisterPhone),
      body: json.encode({'name': 'navid', 'id': 100}),
      headers: {'Content-Type': 'application/json'},
    );
    print(res.body);

    HttpCalls httpCalls = HttpCalls(httpClient: client);
    var res1 = await httpCalls
        .post(url: AccountingURLs.RegisterPhone, body: {'name': 'navid', 'id': 100});

    expect(res1.state.error, equals(result.state.error));
    expect(res1.state.msg, equals(result.state.msg));

    Swimmer swimmerRes = Swimmer.fromJson(res1.data);

    expect(swimmerRes.firstName, equals('firstName'));
  });
}
