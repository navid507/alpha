import 'dart:async';

import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/back/periods/abstracts/periods_repo_abstracts.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/perdiods_apis.dart';
import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/back/periods/sessions_api.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaymentDialogModel extends ChangeNotifier {
  late PeriodsRepoInterface _periodRepo;

  late Period period;
  DialogState dialogState = DialogState.normal;
  String error = '';

  final _registerSwimmerStateController = StreamController<StateResult>();

  Stream<StateResult> get registerSwimmerStateStream =>
      _registerSwimmerStateController.stream;

  PaymentDialogModel({required this.period}) {
    var httpsCalls = HttpCalls(httpClient: http.Client());
    var _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData(deviceInfo: DeviceInfoPlugin()));

    _periodRepo = PeriodsRepo.getInstance(
        periodsApiInterface: PeriodsApi(http: httpsCalls),
        sessionsApiInterface: SessionApi(http: httpsCalls),
        accountingRepositoryInterface: _accountingRepo);
  }

  doRegister(PaymentType typeID) async {
    dialogState = DialogState.loading;
    notifyListeners();

    _periodRepo
        .registerPeriod(periodID: period.id, typeID: typeID)
        .asStream()
        .listen((result) {
      if (result.isSuccess) {
        if (typeID == PaymentType.Online) {
        } else {
          dialogState = DialogState.finish;
        }
      } else {
        dialogState = DialogState.serverError;
        error = result.state.msg;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _registerSwimmerStateController.close();
    super.dispose();
  }
}
