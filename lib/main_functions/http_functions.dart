import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_models/api_result.dart';

abstract class HttpFunctionsInterface {
  Future<APIResult> get({required String url});

  Future<APIResult> post({required String url, Map<String, dynamic> body});
}

class HttpCalls implements HttpFunctionsInterface {
  // var http

  http.Client httpClient;

  HttpCalls({required this.httpClient});

  @override
  Future<APIResult> get({required String url}) async {
    print('url: $url');
    var res = await httpClient.get(Uri.parse(url));

    return createResult(res);
  }

  @override
  Future<APIResult> post(
      {required String url, Map<String, dynamic>? body}) async {
    print('url: $url');
    print('parameters: $body');
    var res = await httpClient.post(
      Uri.parse(url),
      body: json.encode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return createResult(res);
  }

  APIResult createResult(http.Response response) {
    print(response.body);
    if (response.statusCode == 200) {
      // return jsonDecode(res.body);
      return APIResult.fromJson(jsonDecode(response.body));
    } else {
      return APIResult(
          state: StateResult(msg: "server not found!", error: -100));
    }
  }
}
