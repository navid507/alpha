import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/periods_result.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisteredPeriodsModel extends ChangeNotifier {
  late PeriodsRepoInterface _periodsRepo;

  List<Period>? allRegisteredPeriods;
  LoadingState allRegisteredPeriodsState = LoadingState.NotStarted;

  RegisteredPeriodsModel() {
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

  getAllRegisteredPeriods() {
    allRegisteredPeriodsState = LoadingState.Loading;
    notifyListeners();

    _periodsRepo.getAllRegisteredPeriods().asStream().listen((curAllPeriods) {
      if (curAllPeriods is SuccessPeriods) {
        allRegisteredPeriods = curAllPeriods.periods;
        allRegisteredPeriodsState = LoadingState.Loaded;
      } else {
        allRegisteredPeriodsState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
