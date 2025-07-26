import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class RegisterPhoneModel extends ChangeNotifier {
  late AccountingRepositoryInterface _accountingRepo;

  final _registerPhoneStateController = StreamController<StateResult>();

  Stream<StateResult> get registerPhoneStateStream =>
      _registerPhoneStateController.stream;

  DialogState state = DialogState.normal;
  String error = "";

  RegisterPhoneModel() {
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData());
  }

  registerPhone({required String phone}) {
    error = '';
    state = DialogState.loading;
    notifyListeners();

    _registerPhoneStateController.sink.add(StateResult(msg: 'msg', error: -1));

    _accountingRepo.registerPhone(phone).asStream().listen((result) {
      if (result.isSuccess) {
        _registerPhoneStateController.sink.add(result);
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
    _registerPhoneStateController.close();
    super.dispose();
  }
}
