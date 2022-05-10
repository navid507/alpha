import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/record/record.dart';
import 'package:alpha/back/accounting/models/record/record_result.dart';
import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:alpha/back/accounting/models/record/record_type_result.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/public_repo/abstracts/public_repo_abstracts.dart';
import 'package:alpha/back/public_repo/public_apis.dart';
import 'package:alpha/back/public_repo/public_repo.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class SwimmerRecordsModel extends ChangeNotifier {
  late AccountingRepositoryInterface _accountingRepo;

  List<Record>? allRecords;
  LoadingState allRecordsState = LoadingState.NotStarted;
  RecordType swimType;

  SwimmerRecordsModel({required this.swimType}) {
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData(deviceInfo: DeviceInfoPlugin()));
  }

  getAllSwimTypes() {
    allRecordsState = LoadingState.Loading;
    notifyListeners();

    _accountingRepo
        .getAllRecordsOf(swimType)
        .asStream()
        .listen((curAllRecords) {
      if (curAllRecords is SuccessRecords) {
        allRecords = curAllRecords.records;
        allRecordsState = LoadingState.Loaded;
      } else {
        allRecordsState = LoadingState.LoadError;
      }
      notifyListeners();
    });
  }
}
