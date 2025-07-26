import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class VerifyPhoneModel extends ChangeNotifier {
  late AccountingRepositoryInterface _accountingRepo;

  final _verifyPhoneStateController = StreamController<StateResult>();

  Stream<StateResult> get verifyPhoneStream =>
      _verifyPhoneStateController.stream;

  DialogState state = DialogState.normal;
  String error = "";

  VerifyPhoneModel() {
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData());
  }

  resetPhone() async {
    await _accountingRepo.resetRegisterState();
  }

  verifyPhone({required String code}) {
    error = '';
    state = DialogState.loading;
    notifyListeners();

    _verifyPhoneStateController.sink.add(StateResult(msg: 'msg', error: -1));

    _accountingRepo.verifyPhone(code).asStream().listen((result) {
      if (result.isSuccess) {
        _verifyPhoneStateController.sink.add(result);
        state = DialogState.finish;
      } else {
        error = result.msg;
        state = DialogState.serverError;
      }
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _verifyPhoneStateController.close();
    super.dispose();
  }
}
