import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer_result.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/period_result.dart';
import 'package:alpha/back/periods/models/period/registered_period.dart';
import 'package:alpha/back/periods/models/period/registered_period_result.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileModel extends ChangeNotifier {
  late AccountingRepositoryInterface _accountingRepo;
  late PeriodsRepoInterface _periodRepo;

  // final _profileStateController = StreamController<StateResult>();
  LoadingState profileState = LoadingState.NotStarted;
  LoadingState curPeriodDetailsState = LoadingState.NotStarted;

  // Stream<StateResult> get profileStateStream => _profileStateController.stream;
  Swimmer? activeSwimmer;
  RegisteredPeriod? activePeriod;

  ProfileModel() {
    var httpsCalls = HttpCalls(httpClient: http.Client());
    _accountingRepo =
        AccountingRepo.getInstance(userStoredData: UserStoredData());

    _periodRepo = PeriodsRepo.getInstance(
        periodsApiInterface: PeriodsApi(http: httpsCalls),
        sessionsApiInterface: SessionApi(http: httpsCalls),
        accountingRepositoryInterface: _accountingRepo);

    _accountingRepo.activeSwimmerStream.listen((aS) {
      // this.activeSwimmer = SwimmerResult.success(activeSwimmer);
      getActiveSwimmer();
      // notifyListeners();
      activeSwimmer = aS;
      notifyListeners();
    });
  }

  getActiveSwimmer() {
    profileState = LoadingState.Loading;
    notifyListeners();

    _accountingRepo.getActiveSwimmer().asStream().listen((swimmer) {
      profileState = LoadingState.Loaded;
      activeSwimmer = swimmer;
      notifyListeners();
    });
  }

  getCurActivePeriodDetails() {
    curPeriodDetailsState = LoadingState.Loading;
    notifyListeners();

    _periodRepo.getActivePeriod().asStream().listen((period) {
      if (period is SuccessRegisteredPeriod) {
        curPeriodDetailsState = LoadingState.Loaded;
        activePeriod = period.period;
      } else if (period is ErrorRegisteredPeriod) {
        if (period.code == 1) {
          curPeriodDetailsState = LoadingState.Loaded;
        } else {
          curPeriodDetailsState = LoadingState.LoadError;
        }
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // _profileStateController.close();
    super.dispose();
  }
}
