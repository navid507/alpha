// import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';
import 'dart:io';

import 'main_models/api_result.dart';

abstract class HttpFunctionsInterface {
  Future<APIResult> get({required String url});

  Future<APIResult> post({required String url, Map<String, dynamic> body});

  Future<APIResult> multiPartPost(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, String>? files});
}

class HttpCalls implements HttpFunctionsInterface {
  @override
  Future<APIResult> multiPartPost(
      {required String url,
      Map<String, dynamic>? body,
      Map<String, String>? files}) async {
    print('url: $url');
    print('parameters: $body');
    var req = http.MultipartRequest("POST", Uri.parse(url));

    for (String key in body!.keys) {
      req.fields[key] = body[key];
    }

    for (String key in files!.keys) {
      // req.fields[key] = body[key];
      var filePath = files[key];
      req.files.add(http.MultipartFile.fromBytes(
          key, await File.fromUri(Uri.parse(filePath!)).readAsBytes(),
          contentType: MediaType('image', 'jpeg'),
          filename: filePath.split("/").last));
    }
    try {
      var res = await req.send();
      if (res.statusCode == 200) {
        var jsonRes = await createResultFromStreamedResponse(res);
        return jsonRes;
      } else {
        print(await res.stream.transform(utf8.decoder).join());

        // print(res.stream.toString());
        // print(utf8.decodeStream(res.stream));
        return Future<APIResult>.value(APIResult(
            state: StateResult(
                msg: "nnr: ${res.reasonPhrase ?? ""}", error: res.statusCode)));
      }
    } catch (e) {
      return Future<APIResult>.value(APIResult(
          state: StateResult(msg: "network not reachable!", error: -101)));
    }

    // var res = await httpMultiPart.Mul(
    //   Uri.parse(url),
    //   body: json.encode(body),
    //   headers: {'Content-Type': 'application/json'},
    // );
  }

  // var http

  http.Client httpClient;

  HttpCalls({required this.httpClient});

  @override
  Future<APIResult> get({required String url}) async {
    print('url: $url');
    try {
      var res = await httpClient.get(Uri.parse(url));

      return createResult(res);
    } catch (e) {
      return Future<APIResult>.value(APIResult(
          state: StateResult(msg: "network not reachable!", error: 101)));
    }
  }

  @override
  Future<APIResult> post(
      {required String url, Map<String, dynamic>? body}) async {
    print('url: $url');
    print('parameters: $body');
    try {
      var res = await httpClient.post(
        Uri.parse(url),
        body: json.encode(body),
        headers: {'Content-Type': 'application/json'},
      );
      return createResult(res);
    } catch (e) {
      print('error: $e');

      return Future<APIResult>.value(APIResult(
          state: StateResult(msg: "network not reachable!", error: 101)));
    }
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

  Future<APIResult> createResultFromStreamedResponse(
      http.StreamedResponse response) async {
    if (response.statusCode == 200) {
      var resString = await response.stream.bytesToString();
      return APIResult.fromJson(jsonDecode(resString));
    } else {
      return APIResult(
          state: StateResult(msg: "server not found!", error: -100));
    }
  }
}
