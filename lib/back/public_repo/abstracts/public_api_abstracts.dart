import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/models/alpha_club.dart';
import 'package:alpha/back/public_repo/models/image_item.dart';
import 'package:alpha/back/public_repo/models/top_swimmer.dart';

abstract class PublicApiInterface {

  Future<TopSwimmers?> getTopSwimmers({
  String uid = '-1'
});

  Future<AlphaClub?> getAlphaClub({
     String uid = '-1'
  });


  Future<List<ImageItem>?> getGallery({
    String uid = '-1'
  });

}
