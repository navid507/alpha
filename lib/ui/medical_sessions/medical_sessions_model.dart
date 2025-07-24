import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/medical/medical.dart';
import 'package:alpha/back/periods/models/medical/medical_result.dart';
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

class MedicalSessionsModel extends ChangeNotifier {
  late PeriodsRepoInterface _periodsRepo;

  List<Medical>? allMedicalSessions;
  LoadingState allMedicalSessionsState = LoadingState.NotStarted;

  MedicalSessionsModel() {
    _periodsRepo = PeriodsRepo.getInstance(
        periodsApiInterface:
            PeriodsApi(http: HttpCalls(httpClient: http.Client())),
        sessionsApiInterface:
            SessionApi(http: HttpCalls(httpClient: http.Client())),
        accountingRepositoryInterface: AccountingRepo.getInstance(
            userStoredData: UserStoredData(deviceInfo: DeviceInfoPlugin())));
  }

  getAllMedicalSessions() {
    allMedicalSessionsState = LoadingState.Loading;
    notifyListeners();

    _periodsRepo.getAllMedicals().asStream().listen((curAllMedicalSessions) {
      if (curAllMedicalSessions is SuccessMedicals) {
        allMedicalSessions = curAllMedicalSessions.medicalsSessions;
        allMedicalSessionsState = LoadingState.Loaded;
      } else {
        allMedicalSessionsState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
