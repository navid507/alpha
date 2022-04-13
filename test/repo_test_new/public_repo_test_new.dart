import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_group.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_swimmer.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams_result.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/team_info.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/team_member.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'public_repo_test_new.mocks.dart';

@GenerateMocks([PublicApis])
void main() {
  var alphaSwimmer1 = AlphaSwimmer(
      score: "9",
      image: "image",
      fullName: "alpha 1",
      sessions: "1200",
      id: '1');
  var alphaSwimmer2 = AlphaSwimmer(
      score: "8",
      image: "image",
      fullName: "alpha 2",
      sessions: "1200",
      id: '1');
  var alphaSwimmer3 = AlphaSwimmer(
      score: "7",
      image: "image",
      fullName: "alpha 3",
      sessions: "1200",
      id: '1');

  var alphaSwimmers = [alphaSwimmer1, alphaSwimmer2, alphaSwimmer3];
  var alphaGroup = AlphaGroup(title: "alpha group", swimmers: alphaSwimmers);

  var betaSwimmer1 = AlphaSwimmer(
      score: "7", image: "image", fullName: "beta 1", sessions: "720", id: '1');
  var betaSwimmer2 = AlphaSwimmer(
      score: "7", image: "image", fullName: "beta 2", sessions: "720", id: '1');
  var betaSwimmer3 = AlphaSwimmer(
      score: "7", image: "image", fullName: "beta 3", sessions: "720", id: '1');
  var betaSwimmers = [betaSwimmer1, betaSwimmer2, betaSwimmer3];
  var betaGroup = AlphaGroup(title: "beta group", swimmers: betaSwimmers);

  var omegSwimmer1 = AlphaSwimmer(
      score: "7", image: "image", fullName: "omeg 1", sessions: "720", id: '1');
  var omegSwimmer2 = AlphaSwimmer(
      score: "7", image: "image", fullName: "omeg 2", sessions: "720", id: '1');
  var omegSwimmer3 = AlphaSwimmer(
      score: "7", image: "image", fullName: "omeg 3", sessions: "720", id: '1');
  var omegSwimmers = [omegSwimmer1, omegSwimmer2, omegSwimmer3];
  var omegGroup = AlphaGroup(title: "omeg group", swimmers: omegSwimmers);

  AlphaClub alphaClub = AlphaClub(
      alphaSwimmers: alphaGroup,
      betaSwimmers: betaGroup,
      omegaSwimmers: omegGroup);

  late MockPublicApis mockPublicApis = MockPublicApis();

  late PublicRepositoryInterface publicRepo;
  setUp(() {
    publicRepo = PublicRepo.getInstance(mockPublicApis);
  });

  test('is get club ok', () async {
    when(mockPublicApis.getAlphaClub()).thenAnswer(
        (realInvocation) async => AlphaClubResult.success(alphaClub));

    publicRepo.getAlphaClub();
    // publicRepo.alphaClubStream.listen((AlphaClub alphaClub) {
    //   expect(alphaClub.alphaSwimmers.swimmers.length, greaterThan(1));
    // }, onError: (error) {
    //   fail('problem $error');
    // }, onDone: () {});
  });

  var image1 = AlphaImageItem(
      id: "1",
      title: "title",
      content: "content",
      link: "link",
      image: "image1");
  var image2 = AlphaImageItem(
      id: "2",
      title: "title",
      content: "content",
      link: "link",
      image: "image2");
  var image3 = AlphaImageItem(
      id: "3",
      title: "title",
      content: "content",
      link: "link",
      image: "image3");

  var gallery = AlphaImageGallery(images: [image1, image2, image3]);
  test('is gallery ok', () async {
    when(mockPublicApis.getGallery())
        .thenAnswer((realInvocation) async => GalleryResult.success(gallery));

    publicRepo.getGallery();
    // publicRepo.galleryStream.listen((AlphaImageGallery gallery) {
    //   expect(gallery.images.length, greaterThan(1));
    // }, onError: (error) {
    //   fail('problem $error');
    // }, onDone: () {});
  });
  TopSwimmer topSwimmer1 = TopSwimmer(
      name: 'name1',
      image: 'image',
      absent: '0',
      present: '100',
      score: '7.5',
      total: '8.7',
      id: '1');
  TopSwimmer topSwimmer2 = TopSwimmer(
      name: 'name2',
      image: 'image',
      absent: '0',
      present: '100',
      score: '7.5',
      total: '8.7',
      id: '1');
  TopSwimmer topSwimmer3 = TopSwimmer(
      name: 'name3',
      image: 'image',
      absent: '0',
      present: '100',
      score: '7.5',
      total: '8.7',
      id: '1');

  TopSwimmers topSwimmers = TopSwimmers(
      title: 'title', topSwimmers: [topSwimmer1, topSwimmer2, topSwimmer3]);
  test('is top swimmers ok', () async {
    when(mockPublicApis.getTopSwimmers()).thenAnswer(
        (realInvocation) async => TopSwimmersResult.success(topSwimmers));

    publicRepo.getTopSwimmers();
    // publicRepo.topSwimmersStream.listen((TopSwimmers topSwimmers) {
    //   expect(topSwimmers.topSwimmers.length, greaterThan(1));
    // }, onError: (error) {
    //   fail('problem $error');
    // }, onDone: () {});
  });

  var alphaTeamMember11 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember12 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember13 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember14 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var teamInfo1 = TeamInfo(name: 'team1', rank: 1, score: 4, members: [
    alphaTeamMember11,
    alphaTeamMember12,
    alphaTeamMember13,
    alphaTeamMember14
  ]);

  var alphaTeamMember21 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember22 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember23 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember24 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var teamInfo2 = TeamInfo(name: 'team2', rank: 2, score: 4, members: [
    alphaTeamMember21,
    alphaTeamMember22,
    alphaTeamMember23,
    alphaTeamMember24
  ]);

  var alphaTeamMember31 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember32 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember33 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var alphaTeamMember34 =
      TeamMember(name: 'name', score: 4, image: 'image', id: '-1');
  var teamInfo3 = TeamInfo(name: 'team3', rank: 3, score: 4, members: [
    alphaTeamMember31,
    alphaTeamMember32,
    alphaTeamMember33,
    alphaTeamMember34
  ]);

  var alphaTeamsMock =
      AlphaTeams(alphaTeams: [teamInfo2, teamInfo1, teamInfo3]);

  test('is alpha teams ok', () async {
    when(mockPublicApis.getAlphaTeams()).thenAnswer(
        (realInvocation) async => AlphaTeamsResult.success(alphaTeamsMock));

    publicRepo.getAlphaTeams();
    // publicRepo.alphaTeamsStream.listen((AlphaTeams alphaTeams) {
    //   expect(alphaTeams.getRankedTeams()[1].rank, equals(2));
    // }, onError: (error) {
    //   fail('problem $error');
    // }, onDone: () {});
  });
}
