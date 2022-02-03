import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams_result.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';

abstract class PublicRepositoryInterface {
  // Stream<AlphaClub> get alphaClubStream;

  Stream<String> get alphaClubErrorStream;

  // Stream<AlphaImageGallery> get galleryStream;

  Stream<String> get galleryErrorStream;

  // Stream<TopSwimmers> get topSwimmersStream;

  Stream<String> get topSwimmersErrorStream;

  Stream<String> get alphaTeamsErrorStream;

  // Stream<AlphaTeams> get alphaTeamsStream;

  Future<TopSwimmersResult> getTopSwimmers();

  Future<GalleryResult> getGallery();

  Future<AlphaClubResult> getAlphaClub();

  Future<AlphaTeamsResult> getAlphaTeams();

// registerPeriod();
// cancelPeriod();

}
