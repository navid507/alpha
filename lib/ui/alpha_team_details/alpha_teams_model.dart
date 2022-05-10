import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams_result.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AlphaTeamsModel extends ChangeNotifier {
  late PublicRepositoryInterface _publicRepo;
  AlphaTeams? alphaTeams;
  LoadingState alphaTeamsState = LoadingState.NotStarted;

  AlphaTeamsModel() {
    _publicRepo = PublicRepo.getInstance(
        PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
  }

  getAlphaTeams() {
    alphaTeamsState = LoadingState.Loading;
    notifyListeners();

    _publicRepo.getAlphaTeams().asStream().listen((curAlphaTopSwimmers) {
      if (curAlphaTopSwimmers is SuccessAlphaTeams) {
        alphaTeams = curAlphaTopSwimmers.alphaTeam;
        alphaTeamsState = LoadingState.Loaded;
      } else {
        alphaTeamsState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
