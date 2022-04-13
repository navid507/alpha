import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:alpha/back/accounting/models/record/record_type_result.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/main_functions/http_functions.dart';

import '../global_constants.dart';
import 'abstracts/public_api_abstracts.dart';
import 'models/alpha_club/alpha_club.dart';
import 'models/alpha_club/alpha_club_result.dart';
import 'models/alpha_teams/alpha_teams.dart';
import 'models/alpha_teams/alpha_teams_result.dart';
import 'models/public_profile/public_profile.dart';
import 'models/public_profile/public_profile_result.dart';
import 'models/top_swimmers/top_swimmers.dart';
import 'models/top_swimmers/top_swimmers_result.dart';

class PublicURLs {
  static const String _root = "$mainUrl/index.php/alpha_api/base";
  static const String _rootTeam =
      "$mainUrl/index.php/alpha_api/team"; //"https://orkaswim.ir/index.php/alpha_api/team";
  static const String _rootSwimmers = "$mainUrl/index.php/alpha_api/swimmer";
  static const String TopSwimmers = "$_root/top_swimmer";
  static const String AlphaSwimmers = "$_root/alpha_swimmers";
  static const String ImageGallery = "$_root/news";
  static const String AlphaTeams = "$_rootTeam/team_info";
  static const String RecordTypes = "$_root/record_type";
  static const String SwimmerPublicProfile =
      "$_rootSwimmers/get_public_profiles";

// Profile
}

class PublicApis implements PublicApiInterface {
  HttpFunctionsInterface httpCalls;

  PublicApis({required this.httpCalls});

  @override
  Future<AlphaClubResult> getAlphaClub({String uid = '-1'}) async {
    var res = await httpCalls.get(url: PublicURLs.AlphaSwimmers);
    // int err = res.state.error;
    // if (err != 0) return null;
    // return AlphaClub.fromJson(res.data);

    if (res.isSuccess) {
      return AlphaClubResult.success(AlphaClub.fromJson(res.data));
    } else {
      return AlphaClubResult.error(res.state.error, res.state.msg);
    }
  }

  @override
  Future<GalleryResult> getGallery({String uid = '-1'}) async {
    var res = await httpCalls.get(url: PublicURLs.ImageGallery);

    if (res.isSuccess) {
      return GalleryResult.success(AlphaImageGallery.fromJsonImages(res.data));
    } else {
      return GalleryResult.error(res.state.error, res.state.msg);
    }
  }

  @override
  Future<TopSwimmersResult> getTopSwimmers({String uid = '-1'}) async {
    var res = await httpCalls.get(url: PublicURLs.TopSwimmers);
    // int err = res.state.error;
    // if (err != 0) return null;
    // return TopSwimmers.fromJson(res.data);
    if (res.isSuccess) {
      return TopSwimmersResult.success(TopSwimmers.fromJson(res.data));
    } else {
      return TopSwimmersResult.error(res.state.error, res.state.msg);
    }
  }

  @override
  Future<AlphaTeamsResult> getAlphaTeams() async {
    var res = await httpCalls.get(url: PublicURLs.AlphaTeams);
    if (res.isSuccess) {
      return AlphaTeamsResult.success(AlphaTeams.fromJson(res.data));
    } else {
      return AlphaTeamsResult.error(res.state.error, res.state.msg);
    }
  }

  @override
  Future<RecordTypesResult> getRecordTypes() async {
    List<RecordType> records = List.empty(growable: true);

    var res = await httpCalls.get(url: PublicURLs.RecordTypes);

    if (res.isSuccess) {
      List<dynamic> swimmersJson = res.data;
      swimmersJson.forEach((element) {
        records.add(RecordType.fromJson(element));
      });

      return RecordTypesResult.success(records);
    }
    return RecordTypesResult.error(res.state.error, res.state.msg);
  }

  @override
  Future<PublicProfileResult> getPublicProfile(
      {required String swimmerID}) async {
    var body = Map<String, dynamic>();
    body['swimmer_id'] = swimmerID;

    var res =
        await httpCalls.post(url: PublicURLs.SwimmerPublicProfile, body: body);

    if (res.isSuccess) {
      List<PublicProfile> publicProfiles = List.empty(growable: true);
      List<dynamic> swimmersJson = res.data;
      swimmersJson.forEach((element) {
        publicProfiles.add(PublicProfile.fromJson(element));
      });

      return PublicProfileResult.success(publicProfiles.first);
    }
    return PublicProfileResult.error(res.state.error, res.state.msg);
  }
}
