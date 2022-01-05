import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/main_functions/http_functions.dart';

import 'abstracts/public_api_abstracts.dart';
import 'models/alpha_club/alpha_club.dart';
import 'models/alpha_club/alpha_club_result.dart';
import 'models/top_swimmers/top_swimmer.dart';
import 'models/top_swimmers/top_swimmers_result.dart';

class PublicURLs {
  static const String _root = "http://orkaswim.ir/index.php/alpha_api/base";
  static const String TopSwimmers = "$_root/top_swimmer";
  static const String AlphaSwimmers = "$_root/alpha_swimmers";
  static const String ImageGallery = "$_root/news";

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
}
