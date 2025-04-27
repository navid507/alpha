import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/periods_result.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers_result.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PeriodsModel extends ChangeNotifier {
  late PeriodsRepoInterface _periodsRepo;

  List<Period>? allPeriods;
  LoadingState allPeriodsState = LoadingState.NotStarted;

  PeriodsModel() {
    // _periodsRepo = PeriodsRepo.getInstance(accou
    //     PublicApis(httpCalls: HttpCalls(httpClient: http.Client())));
    _periodsRepo = PeriodsRepo.getInstance(
        periodsApiInterface:
            PeriodsApi(http: HttpCalls(httpClient: http.Client())),
        sessionsApiInterface:
            SessionApi(http: HttpCalls(httpClient: http.Client())),
        accountingRepositoryInterface: AccountingRepo.getInstance(
            userStoredData: UserStoredData()));
  }

  getAllPeriods() {
    allPeriodsState = LoadingState.Loading;
    notifyListeners();

    _periodsRepo.getAllPeriods().asStream().listen((curAllPeriods) {
      if (curAllPeriods is SuccessPeriods) {
        allPeriods = curAllPeriods.periods;
        allPeriodsState = LoadingState.Loaded;
      } else {
        allPeriodsState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
