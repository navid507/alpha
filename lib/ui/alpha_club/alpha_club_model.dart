import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club_result.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlphaClubModel extends ChangeNotifier {
  late PublicRepositoryInterface _publicRepo;
  AlphaClub? alphaClub;
  LoadingState alphaClubState = LoadingState.NotStarted;

  AlphaClubModel() {
    _publicRepo = PublicRepo.getInstance(
        PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
  }

  getAlphaClub() {
    alphaClubState = LoadingState.Loading;
    notifyListeners();

    _publicRepo.getAlphaClub().asStream().listen((curAlphaClub) {
      if (curAlphaClub is SuccessAlphaClub) {
        alphaClub = curAlphaClub.alphaClub;
        alphaClubState = LoadingState.Loaded;
      } else {
        alphaClubState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
