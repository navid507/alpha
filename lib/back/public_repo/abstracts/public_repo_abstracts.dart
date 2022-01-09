import 'package:alpha/back/public_repo/models/AlphaTeams/alpha_teams.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';

abstract class PublicRepositoryInterface {
  Stream<AlphaClub> get alphaClubStream;

  Stream<String> get alphaClubErrorStream;

  Stream<AlphaImageGallery> get galleryStream;

  Stream<String> get galleryErrorStream;

  Stream<TopSwimmers> get topSwimmersStream;

  Stream<String> get topSwimmersErrorStream;

  Stream<String> get alphaTeamsErrorStream;

  Stream<AlphaTeams> get alphaTeamsStream;


  getTopSwimmers();

  getGallery();

  getAlphaClub();
  getAlphaTeams();

// registerPeriod();
// cancelPeriod();

}
