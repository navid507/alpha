import 'dart:async';

import 'package:alpha/back/public_repo/abstracts/public_api_abstracts.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_group.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:http/http.dart' as http;

class PublicRepo implements PublicRepositoryInterface {
  // initialization
  static PublicRepo? _instance;

  static PublicRepo getInstance() {
    if (_instance == null) {
      _instance = PublicRepo._internal(
          publicAPI: PublicApis(http: HttpCalls(httpClient: http.Client())));
    }

    return _instance!;
  }

  PublicRepo._internal({required this.publicAPI});

  PublicApiInterface publicAPI;

  // end of initialization

// defining Controllers:
final _alphaClubStreamController = StreamController<AlphaClub>();

// defining Streams:
 Stream<AlphaClub> get alphaClubStream => _alphaClubStreamController.stream;


  AlphaClub? _alphaClub;

  @override
   getAlphaClub() {
   var temp = _alphaClub ?? getAlphaClubFromServer();
   _alphaClubStreamController.sink.add(temp);
    // if (_alphaClub != null)
    //   {
    //     _alphaClubStreamController.sink.add(_alphaClub!);
    //   }else
    //     {
    //    _alphaClub ?? getAlphaClubFromServer;

  }

  getAlphaClubFromServer() async {
    _alphaClub = await publicAPI.getAlphaClub();
  }
}
