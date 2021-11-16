import 'dart:async';

import 'package:alpha/back/public_repo/abstracts/public_api_abstracts.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:http/http.dart' as http;

import 'models/alpha_club/alpha_club.dart';
import 'models/top_swimmers/top_swimmers_result.dart';

class PublicRepo implements PublicRepositoryInterface {
  // initialization
  static PublicRepo? _instance;

  static PublicRepo getInstance(PublicApiInterface publicApiInterface) {
    if (_instance == null) {
      _instance = PublicRepo._internal(
          /* publicAPI: PublicApis(http: HttpCalls(httpClient: http.Client()))*/
          publicAPI: publicApiInterface);
    }

    return _instance!;
  }

  PublicRepo._internal({required this.publicAPI});

  PublicApiInterface publicAPI;

  // end of initialization

// defining Controllers:
  final _alphaClubStreamController = StreamController<AlphaClub>();

// defining Streams:

  @override
  Stream<AlphaClub> get alphaClubStream => _alphaClubStreamController.stream;


  AlphaClub? _alphaClub;

  // defining Controllers:
  final _alphaClubErrorStreamController = StreamController<String>();

// defining Streams:
  Stream<String> get alphaClubErrorStream =>
      _alphaClubErrorStreamController.stream;
  String _alphaClubErrorMsg = '';

  @override
  getAlphaClub() {
    if (_alphaClub != null) {
      _alphaClubStreamController.sink.add(_alphaClub!);
    } else {
      getAlphaClubFromServer();
    }
    // if (_alphaClub != null)
    //   {
    //     _alphaClubStreamController.sink.add(_alphaClub!);
    //   }else
    //     {
    //    _alphaClub ?? getAlphaClubFromServer;
  }

  getAlphaClubFromServer() async {
    var alphaClubResult = await publicAPI.getAlphaClub();
    if (alphaClubResult is SuccessAlphaClub) {
      _alphaClub = alphaClubResult.alphaClub;
      _alphaClubStreamController.sink.add(_alphaClub!);
    } else if (alphaClubResult is ErrorAlphaClub) {
      _alphaClubErrorMsg = alphaClubResult.msg;
      _alphaClubErrorStreamController.sink.add(_alphaClubErrorMsg);
    }

    // _alphaClub = await publicAPI.getAlphaClub();
  }

  // Gallery

  final _galleryStreamController = StreamController<Gallery>();

// defining Streams:
  Stream<Gallery> get galleryStream => _galleryStreamController.stream;
  Gallery? _gallery;

  final _galleryErrorStreamController = StreamController<String>();

// defining Streams:
  Stream<String> get galleryErrorStream => _galleryErrorStreamController.stream;
  String _galleryErrorMsg = '';

  getGallery() async {
    var galleryResult = await publicAPI.getGallery();
    if (galleryResult is SuccessGallery) {
      _gallery = galleryResult.gallery;
      _galleryStreamController.sink.add(_gallery!);
    } else if (galleryResult is ErrorGallery) {
      _galleryErrorMsg = galleryResult.msg;
      _galleryErrorStreamController.sink.add(_galleryErrorMsg);
    }
  }

  // Top Swimmers

  final _topSwimmersStreamController = StreamController<TopSwimmers>();

// defining Streams:
  Stream<TopSwimmers> get topSwimmersStream =>
      _topSwimmersStreamController.stream;
  TopSwimmers? _topSwimmers;

  final _topSwimmersErrorStreamController = StreamController<String>();

// defining Streams:
  Stream<String> get topSwimmersErrorStream =>
      _topSwimmersErrorStreamController.stream;
  String _topSwimmersErrorMsg = '';

  getTopSwimmers() async {
    var topSwimmersResult = await publicAPI.getTopSwimmers();
    if (topSwimmersResult is SuccessTopSwimmers) {
      _topSwimmers = topSwimmersResult.topSwimmers;
      _topSwimmersStreamController.sink.add(_topSwimmers!);
    } else if (topSwimmersResult is ErrorTopSwimmers) {
      _topSwimmersErrorMsg = topSwimmersResult.msg;
      _topSwimmersErrorStreamController.sink.add(_topSwimmersErrorMsg);
    }
  }


}
