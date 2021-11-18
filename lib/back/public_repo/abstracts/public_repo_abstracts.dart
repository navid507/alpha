import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';

abstract class PublicRepositoryInterface {
  Stream<AlphaClub> get alphaClubStream;

  Stream<String> get alphaClubErrorStream;

  Stream<Gallery> get galleryStream;

  Stream<String> get galleryErrorStream;

  Stream<TopSwimmers> get topSwimmersStream;

  Stream<String> get topSwimmersErrorStream;



  getTopSwimmers();

  getGallery();

  getAlphaClub();

  // registerPeriod();
// cancelPeriod();

}
