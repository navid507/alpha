import 'package:alpha/back/public_repo/abstracts/public_api_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:http/http.dart' as http;
void main()
{
  late PublicApiInterface publicApi;//
  setUp(()  {
    publicApi = PublicApis(httpCalls: HttpCalls(httpClient: http.Client()));

  } );


  test('is get club ok', () async {
    var res = await publicApi.getAlphaClub();
    if (res is SuccessAlphaClub) {
      expect(res.alphaClub.omegaSwimmers.swimmers.length, greaterThan(1));
    }
  });

  test('is get top swimmers ok', () async {

    var res = await publicApi.getTopSwimmers();
    if (res is SuccessTopSwimmers) {
      expect(res.topSwimmers.topSwimmers!.length, greaterThan(1));
    }

    // var res = await publicApi.getTopSwimmers();
    // expect(res!.topSwimmers!.length, greaterThan(1));

  });

  test('is get images ok', () async {

    var res = await publicApi.getGallery();
    if (res is SuccessGallery) {
      expect(res.gallery.images.length, greaterThan(1));
    }

    // var res = await publicApi.getGallery();
    // expect(res!.length, greaterThan(1));

  });
}