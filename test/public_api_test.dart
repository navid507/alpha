import 'package:alpha/back/public_repo/abstracts/public_api_abstracts.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
void main()
{
  late PublicApiInterface publicApi;//
  setUp(()  {
    publicApi = PublicApis(http: HttpCalls(httpClient: http.Client()));

  } );
  test('is get club ok', () async {
    var res = await publicApi.getAlphaClub();
    expect(res!.omegaSwimmers.swimmers.length, greaterThan(1));

  });


  test('is get top swimmers ok', () async {
    var res = await publicApi.getTopSwimmers();
    expect(res!.topSwimmers!.length, greaterThan(1));

  });

  test('is get images ok', () async {
    var res = await publicApi.getGallery();
    expect(res!.length, greaterThan(1));

  });
}