import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/back/public_repo/abstracts/public_api_abstracts.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_group.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_swimmer.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'public_repo_test_new.mocks.dart';

// import 'package:http/http.dart' as http;
// import 'public_repo_test.mocks.dart';

// class MockHttpFunctions extends Mock implements HttpCalls {}
// class MockClient extends Mock implements http.Client {}

@GenerateMocks([PublicApis])
void main() {
  // var session1 = Session(description: "description", id: "1", score: "7.5", date: "date", type: "1");
  // var session2 = Session(description: "description", id: "2", score: "7.7", date: "date", type: "1");

  var alphaSwimmer1 = AlphaSwimmer(
      score: "9", image: "image", fullName: "alpha 1", sessions: "1200");
  var alphaSwimmer2 = AlphaSwimmer(
      score: "8", image: "image", fullName: "alpha 2", sessions: "1200");
  var alphaSwimmer3 = AlphaSwimmer(
      score: "7", image: "image", fullName: "alpha 3", sessions: "1200");

  var alphaSwimmers = [alphaSwimmer1, alphaSwimmer2, alphaSwimmer3];
  var alphaGroup = AlphaGroup(title: "alpha group", swimmers: alphaSwimmers);

  var betaSwimmer1 = AlphaSwimmer(
      score: "7", image: "image", fullName: "beta 1", sessions: "720");
  var betaSwimmer2 = AlphaSwimmer(
      score: "7", image: "image", fullName: "beta 2", sessions: "720");
  var betaSwimmer3 = AlphaSwimmer(
      score: "7", image: "image", fullName: "beta 3", sessions: "720");
  var betaSwimmers = [betaSwimmer1, betaSwimmer2, betaSwimmer3];
  var betaGroup = AlphaGroup(title: "beta group", swimmers: betaSwimmers);

  var omegSwimmer1 = AlphaSwimmer(
      score: "7", image: "image", fullName: "omeg 1", sessions: "720");
  var omegSwimmer2 = AlphaSwimmer(
      score: "7", image: "image", fullName: "omeg 2", sessions: "720");
  var omegSwimmer3 = AlphaSwimmer(
      score: "7", image: "image", fullName: "omeg 3", sessions: "720");
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
    publicRepo.alphaClubStream.listen((AlphaClub alphaClub) {
      expect(alphaClub.alphaSwimmers.swimmers.length, greaterThan(1));
    }, onError: (error) {
      fail('problem $error');
    }, onDone: () {});
  });

  var image1 = ImageItem(
      id: "1",
      title: "title",
      content: "content",
      link: "link",
      image: "image1");
  var image2 = ImageItem(
      id: "2",
      title: "title",
      content: "content",
      link: "link",
      image: "image2");
  var image3 = ImageItem(
      id: "3",
      title: "title",
      content: "content",
      link: "link",
      image: "image3");

  var gallery = Gallery(images: [image1, image2, image3]);
  test('is gallery ok', () async {
    when(mockPublicApis.getGallery())
        .thenAnswer((realInvocation) async => GalleryResult.success(gallery));

    publicRepo.getGallery();
    publicRepo.galleryStream.listen((Gallery gallery) {
      expect(gallery.images.length, greaterThan(1));
    }, onError: (error) {
      fail('problem $error');
    }, onDone: () {});
  });
  TopSwimmer topSwimmer1 = TopSwimmer(
      name: 'name1',
      image: 'image',
      absent: '0',
      present: '100',
      score: '7.5',
      total: '8.7');
  TopSwimmer topSwimmer2 = TopSwimmer(
      name: 'name2',
      image: 'image',
      absent: '0',
      present: '100',
      score: '7.5',
      total: '8.7');
  TopSwimmer topSwimmer3 = TopSwimmer(
      name: 'name3',
      image: 'image',
      absent: '0',
      present: '100',
      score: '7.5',
      total: '8.7');

  TopSwimmers topSwimmers = TopSwimmers(
      title: 'title', topSwimmers: [topSwimmer1, topSwimmer2, topSwimmer3]);
  test('is top swimmers ok', () async {
    when(mockPublicApis.getTopSwimmers()).thenAnswer(
        (realInvocation) async => TopSwimmersResult.success(topSwimmers));

    publicRepo.getTopSwimmers();
    publicRepo.topSwimmersStream.listen((TopSwimmers topSwimmers) {
      expect(topSwimmers.topSwimmers!.length, greaterThan(1));
    }, onError: (error) {
      fail('problem $error');
    }, onDone: () {});
  });
}
