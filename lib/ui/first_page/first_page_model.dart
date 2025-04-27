import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams_result.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery_result.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:http/http.dart' as http;

// abstract class GetSwimmerInterface extends ChangeNotifier {
//   Swimmer? activeSwimmer;
// }

class FirstPageModel extends ChangeNotifier {
  late AccountingRepositoryInterface
      _accountingRepo; // = AccountingRepo.getInstance();
  LoadingState topSwimmersState = LoadingState.NotStarted;
  LoadingState alphaClubState = LoadingState.NotStarted;
  LoadingState galleryState = LoadingState.NotStarted;
  LoadingState alphaTeamsState = LoadingState.NotStarted;

  FirstPageModel() {
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData());
  }

  PublicRepositoryInterface _publicRepo = PublicRepo.getInstance(
      PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));

  Swimmer? activeSwimmer;

  // Swimmer? get swimmer => _activeSwimmer;

  AlphaImageGallery? alphaImageGallery;

  // AlphaImageGallery? get alphaImageGallery => _alphaImageGallery;
  TopSwimmers? alphaTopSwimmers;

  AlphaClub? alphaClub;

  AlphaTeams? alphaTeams;

  getActiveSwimmer() {
    _accountingRepo.activeSwimmerStream.listen((swimmer) {
      activeSwimmer = swimmer;
      notifyListeners();
    });
    _accountingRepo.updateActiveSwimmer();
  }

  getGallery() {
    _publicRepo.getGallery().asStream().listen((curAlphaImageGallery) {
      if (curAlphaImageGallery is SuccessGallery) {
        alphaImageGallery = curAlphaImageGallery.gallery;
        galleryState = LoadingState.Loaded;
      } else {
        galleryState = LoadingState.LoadError;
      }
      notifyListeners();
    });
    // _publicRepo.getGallery();
  }

  getTopSwimmers() {
    _publicRepo.getTopSwimmers().asStream().listen((curAlphaTopSwimmers) {
      if (curAlphaTopSwimmers is SuccessTopSwimmers) {
        alphaTopSwimmers = curAlphaTopSwimmers.topSwimmers;
        topSwimmersState = LoadingState.Loaded;
      } else {
        topSwimmersState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }

  getAlphaClub() {
    _publicRepo.getAlphaClub().asStream().listen((curAlphaClub) {
      if (curAlphaClub is SuccessAlphaClub) {
        alphaClubState = LoadingState.Loaded;
        alphaClub = curAlphaClub.alphaClub;
      } else {
        alphaClubState = LoadingState.LoadError;
      }
      notifyListeners();
    });
    // _publicRepo.getAlphaClub();
  }

  getAlphaTeams() {
    _publicRepo.getAlphaTeams().asStream().listen((curAlphaTeams) {
      if (curAlphaTeams is SuccessAlphaTeams) {
        alphaTeamsState = LoadingState.Loaded;
        alphaTeams = curAlphaTeams.alphaTeam;
      } else {
        alphaTeamsState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
