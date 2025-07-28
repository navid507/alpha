import 'dart:async';

import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SessionDetailsModel extends ChangeNotifier {
  late PeriodsRepoInterface _periodsRepo;

  Session curSession;
  LoadingState setScoreState = LoadingState.NotStarted;
  StreamController<LoadingState> _setScoreStreamController = StreamController();

  Stream<LoadingState> get setScoreStream => _setScoreStreamController.stream;

  SessionDetailsModel({required this.curSession}) {
    // _periodsRepo = PeriodsRepo.getInstance(accou
    //     PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
    _periodsRepo = PeriodsRepo.getInstance(
        periodsApiInterface:
            PeriodsApi(http: HttpCalls(httpClient: http.Client())),
        sessionsApiInterface:
            SessionApi(http: HttpCalls(httpClient: http.Client())),
        accountingRepositoryInterface: AccountingRepo.getInstance(
            userStoredData: UserStoredData(deviceInfo: DeviceInfoPlugin())));
  }

  setScoreAndComment(String score, String comment) {
    setScoreState = LoadingState.Loading;
    notifyListeners();

    _periodsRepo
        .setSessionScore(
            sessionID: curSession.id, score: score, comment: comment)
        .asStream()
        .listen((curAllPeriods) {
      if (curAllPeriods.isSuccess) {
        setScoreState = LoadingState.Loaded;
      } else {
        setScoreState = LoadingState.LoadError;
      }
      _setScoreStreamController.sink.add(setScoreState);

      notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _setScoreStreamController.close();
    super.dispose();
  }
}
