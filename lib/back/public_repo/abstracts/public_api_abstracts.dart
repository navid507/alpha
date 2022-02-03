import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams_result.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';

abstract class PublicApiInterface {

  Future<TopSwimmersResult> getTopSwimmers({
  String uid = '-1'
});

  Future<AlphaClubResult> getAlphaClub({
     String uid = '-1'
  });


  Future<GalleryResult> getGallery({
    String uid = '-1'
  });

  Future<AlphaTeamsResult> getAlphaTeams();

}
