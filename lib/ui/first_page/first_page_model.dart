import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

// abstract class GetSwimmerInterface extends ChangeNotifier {
//   Swimmer? activeSwimmer;
// }

class FirstPageModel extends ChangeNotifier {
  AccountingRepositoryInterface _accountingRepo = AccountingRepo.getInstance();

  PublicRepositoryInterface _publicRepo = PublicRepo.getInstance(
      PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));

  Swimmer? activeSwimmer;

  // Swimmer? get swimmer => _activeSwimmer;

  AlphaImageGallery? alphaImageGallery;

  // AlphaImageGallery? get alphaImageGallery => _alphaImageGallery;
  TopSwimmers? alphaTopSwimmers;

  AlphaClub? alphaClub;

  getActiveSwimmer() {
    _accountingRepo.activeSwimmerStream.listen((swimmer) {
      activeSwimmer = swimmer;
      notifyListeners();
    });
    _accountingRepo.updateActiveSwimmer();
  }

  getGallery() {
    _publicRepo.galleryStream.listen((curAlphaImageGallery) {
      alphaImageGallery = curAlphaImageGallery;
      notifyListeners();
    });
    _publicRepo.getGallery();
  }

  getTopSwimmers() {
    _publicRepo.topSwimmersStream.listen((curAlphaTopSwimmers) {
      alphaTopSwimmers = curAlphaTopSwimmers;
      notifyListeners();
    });
    _publicRepo.getTopSwimmers();
  }

  getAlphaClub() {
    _publicRepo.alphaClubStream.listen((curAlphaClub) {
      alphaClub = curAlphaClub;
      notifyListeners();
    });
    _publicRepo.getAlphaClub();
  }

// getInTeamCompetitions() {
  //   _publicRepo.tea.listen((curAlphaTopSwimmers) {
  //     alphaTopSwimmers = curAlphaTopSwimmers;
  //     notifyListeners();
  //   });
  //   _publicRepo.getTopSwimmers();
  // }
}
