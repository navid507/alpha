

import 'dart:convert';

import 'package:alpha/back/public_repo/models/alpha_club.dart';
import 'package:flutter_test/flutter_test.dart';

String res = '''
{
    "data": {
        "title": "",
        "alpha": {
            "list": [
                {
                    "average": "7.39",
                    "present": "1020",
                    "name": "فرنام,ثقفی",
                    "image": "a458e7740d2a506f37b07cfb1c0c450b.jpg",
                    "user_id": "23"
                }
            ],
            "title": "باشگاه 1000 تایی ها"
        },
        "beta": {
            "list": [
                {
                    "average": "7.39",
                    "present": "1020",
                    "name": "فرنام,ثقفی",
                    "image": "a458e7740d2a506f37b07cfb1c0c450b.jpg",
                    "user_id": "23"
                }
            ],
            "title": "باشگاه 700 تایی ها"
        },
        "omega": {
            "list": [
                {
                    "average": "7.08",
                    "present": "961",
                    "name": "امیریوسف ,شاهزاده حمزه",
                    "image": "15b239cd3144a6d6ccf9e2fb3ab18c55.jpg",
                    "user_id": "62"
                },
                {
                    "average": "7.06",
                    "present": "934",
                    "name": "امیرعلی,مینویی",
                    "image": "cb9cceff7990cbf2fe4e99abc5cb1113.jpg",
                    "user_id": "52"
                },
                {
                    "average": "6.87",
                    "present": "889",
                    "name": "امیرعلی ,سلامتی",
                    "image": "2f4d04204500c28bd42b2dfa82af0089.jpg",
                    "user_id": "348"
                },
                {
                    "average": "7.18",
                    "present": "888",
                    "name": "ارمیا,وحیدی نیا",
                    "image": "b1c97266fdb69b2a7e8dfb4261e1a3c6.jpg",
                    "user_id": "163"
                },
                {
                    "average": "7.08",
                    "present": "712",
                    "name": "سپهر,سبزپوش",
                    "image": "af740cc19acf2d1cc53afa41c42eb783.jpg",
                    "user_id": "90"
                },
                {
                    "average": "6.54",
                    "present": "704",
                    "name": "امین,رضائی کوشک مهدی",
                    "image": "db44049c8eb530bacf533c6a70b60dee.jpg",
                    "user_id": "354"
                }
            ],
            "title": "باشگاه 500 تایی ها"
        }
    },
    "state": {
        "error": 0,
        "msg": "موفق"
    }
}
''';

main() {
  // test('is alpha title ok', () {
  //   var alphaClub = AlphaClub.fromJson(json.decode(res)['data']);
  //   expect(alphaClub.alphaSwimmers.title, equals('alpha'));
  // });
  test('is alpha number is ok', () {
    var alphaClub = AlphaClub.fromJson(json.decode(res)['data']);
    expect(alphaClub.alphaSwimmers.swimmers.length, equals(1));
  });
  test('is beta number is ok', () {
    var alphaClub = AlphaClub.fromJson(json.decode(res)['data']);
    expect(alphaClub.betaSwimmers.swimmers.length, equals(1));
  });
  test('is omega number is ok', () {
    var alphaClub = AlphaClub.fromJson(json.decode(res)['data']);
    expect(alphaClub.omegaSwimmers.swimmers.length, equals(6));
  });
}