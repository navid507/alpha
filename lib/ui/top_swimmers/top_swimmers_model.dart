import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TopSwimmersModel extends ChangeNotifier {
  late PublicRepositoryInterface _publicRepo;
  TopSwimmers? alphaTopSwimmers;
  LoadingState topSwimmersState = LoadingState.NotStarted;

  TopSwimmersModel() {
    _publicRepo = PublicRepo.getInstance(
        PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
  }

  getTopSwimmers() {
    topSwimmersState = LoadingState.Loading;
    notifyListeners();

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
}
