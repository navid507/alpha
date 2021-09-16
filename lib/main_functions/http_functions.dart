import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class HttpFunctionsInterface {
  Future<Map<String, dynamic>> get({required String url});

  Future<Map<String, dynamic>> post(
      {required String url, Map<String, dynamic> body});
}

class HttpCalls implements HttpFunctionsInterface {
  @override
  Future<Map<String, dynamic>> get({required String url}) async {
    var res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return {"error": "cant find the url"};
    }
  }

  @override
  Future<Map<String, dynamic>> post(
      {required String url, Map<String, dynamic>? body}) async {
    var res = await http.post(Uri.parse(url), body: body);
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      return {"error": "cant find the url"};
    }
  }
}
