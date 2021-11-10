

import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/models/image_item.dart';
import 'package:alpha/main_functions/http_functions.dart';

import 'abstracts/public_api_abstracts.dart';
import 'models/alpha_club.dart';
import 'models/top_swimmer.dart';


class PublicURLs {
  static const String _root = "http://orkaswim.ir/index.php/alpha_api/base";
  static const String TopSwimmers = "$_root/top_swimmer";
  static const String AlphaSwimmers = "$_root/alpha_swimmers";
  static const String ImageGallery = "$_root/news";


// Profile
}

class PublicApis implements PublicApiInterface{

  HttpFunctionsInterface http;

  PublicApis({required this.http});

  @override
  Future<AlphaClub?> getAlphaClub({String uid = '-1'}) async {
    var res = await http.get(url: PublicURLs.AlphaSwimmers);
    int err = res.state.error;
    if (err != 0) return null;
    return AlphaClub.fromJson(res.data);

  }

  @override
  Future<List<ImageItem>?> getGallery({String uid = '-1'}) async{
    var res = await http.get(url: PublicURLs.ImageGallery);
    int err = res.state.error;
    if (err != 0) return null;

    List<ImageItem> tImages = List.empty(growable: true);
    List<dynamic> jImages = res.data;
    jImages.forEach((element) {
      ImageItem imageItem = ImageItem.fromJson(element);
      tImages.add(imageItem);
    });

    return tImages;

  }

  @override
  Future<TopSwimmers?> getTopSwimmers({String uid = '-1'}) async {
    var res = await http.get(url: PublicURLs.TopSwimmers);
    int err = res.state.error;
    if (err != 0) return null;
    return TopSwimmers.fromJson(res.data);
  }
  
} 