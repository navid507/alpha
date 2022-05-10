import 'dart:async';

import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:alpha/back/accounting/models/record/record_type_result.dart';
import 'package:alpha/back/public_repo/abstracts/public_api_abstracts.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/public_profile/public_profile.dart';
import 'package:alpha/back/public_repo/models/public_profile/public_profile_result.dart';

import 'models/alpha_club/alpha_club.dart';
import 'models/alpha_teams/alpha_teams.dart';
import 'models/alpha_teams/alpha_teams_result.dart';
import 'models/top_swimmers/top_swimmers.dart';
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
  Future<AlphaClubResult> getAlphaClub() {
    if (_alphaClub != null) {
      _alphaClubStreamController.sink.add(_alphaClub!);
      return Future<AlphaClubResult>.value(
          AlphaClubResult.success(_alphaClub!));
    } else {
      return getAlphaClubFromServer();
    }
  }

  Future<AlphaClubResult> getAlphaClubFromServer() async {
    var alphaClubResult = await publicAPI.getAlphaClub();
    if (alphaClubResult is SuccessAlphaClub) {
      _alphaClub = alphaClubResult.alphaClub;
      _alphaClubStreamController.sink.add(_alphaClub!);
    } else if (alphaClubResult is ErrorAlphaClub) {
      _alphaClubErrorMsg = alphaClubResult.msg;
      _alphaClubErrorStreamController.sink.add(_alphaClubErrorMsg);
    }
    return alphaClubResult;

    // _alphaClub = await publicAPI.getAlphaClub();
  }

  // Gallery

  final _galleryStreamController = StreamController<AlphaImageGallery>();

// defining Streams:
  Stream<AlphaImageGallery> get galleryStream =>
      _galleryStreamController.stream;
  AlphaImageGallery? _gallery;

  final _galleryErrorStreamController = StreamController<String>();

// defining Streams:
  Stream<String> get galleryErrorStream => _galleryErrorStreamController.stream;
  String _galleryErrorMsg = '';

  @override
  Future<GalleryResult> getGallery() async {
    if (_gallery != null) {
      return Future<GalleryResult>.value(GalleryResult.success(_gallery!));
    } else {
      var galleryResult = await publicAPI.getGallery();
      if (galleryResult is SuccessGallery) {
        _gallery = galleryResult.gallery;
        _galleryStreamController.sink.add(_gallery!);
      } else if (galleryResult is ErrorGallery) {
        _galleryErrorMsg = galleryResult.msg;
        _galleryErrorStreamController.sink.add(_galleryErrorMsg);
      }
      return galleryResult;
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

  @override
  Future<TopSwimmersResult> getTopSwimmers() async {
    var topSwimmersResult = await publicAPI.getTopSwimmers();
    if (topSwimmersResult is SuccessTopSwimmers) {
      _topSwimmers = topSwimmersResult.topSwimmers;
      _topSwimmersStreamController.sink.add(_topSwimmers!);
    } else if (topSwimmersResult is ErrorTopSwimmers) {
      _topSwimmersErrorMsg = topSwimmersResult.msg;
      _topSwimmersErrorStreamController.sink.add(_topSwimmersErrorMsg);
    }
    return topSwimmersResult;
  }

  // Alpha Team

  AlphaTeams? _alphaTeams;
  final _alphaTeamsStreamController = StreamController<AlphaTeams>();

  @override
  Stream<AlphaTeams> get alphaTeamsStream => _alphaTeamsStreamController.stream;

  final _alphaTeamsErrorStreamController = StreamController<String>();

  @override
  Stream<String> get alphaTeamsErrorStream =>
      _alphaClubErrorStreamController.stream;
  String _alphaTeamsErrorMsg = '';

  @override
  Future<AlphaTeamsResult> getAlphaTeams() {
    if (_alphaTeams != null) {
      _alphaTeamsStreamController.sink.add(_alphaTeams!);
      return Future<AlphaTeamsResult>.value(
          AlphaTeamsResult.success(_alphaTeams!));
    } else {
      return getAlphaTeamsFromServer();
    }
  }

  Future<AlphaTeamsResult> getAlphaTeamsFromServer() async {
    var alphaTeamResult = await publicAPI.getAlphaTeams();
    if (alphaTeamResult is SuccessAlphaTeams) {
      _alphaTeams = alphaTeamResult.alphaTeam;
      _alphaTeamsStreamController.sink.add(_alphaTeams!);
    } else if (alphaTeamResult is ErrorAlphaTeams) {
      _alphaTeamsErrorMsg = alphaTeamResult.msg;
      _alphaTeamsErrorStreamController.sink.add(_alphaTeamsErrorMsg);
    }
    return alphaTeamResult;

    // _alphaClub = await publicAPI.getAlphaClub();
  }

  List<RecordType>? _allSwimTypes;

  @override
  Future<RecordTypesResult> getAllSwimTypes() async {
    if (_allSwimTypes == null) {
      var allSwimTypes = await publicAPI.getRecordTypes();

      if (allSwimTypes is SuccessRecordTypes) {
        _allSwimTypes = allSwimTypes.recordTypes;
      } else if (allSwimTypes is ErrorRecordTypes) {}
      return allSwimTypes;
    } else {
      return Future<RecordTypesResult>.value(
          RecordTypesResult.success(_allSwimTypes!));
    }
  }

  @override
  Future<PublicProfileResult> getPublicProfile(
      {required String swimmerID}) async {
    return publicAPI.getPublicProfile(swimmerID: swimmerID);
  }
}
