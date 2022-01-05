import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/ui/first_page/first_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashModelPhoneState extends ChangeNotifier {}

class SplashModel extends ChangeNotifier {
  PackageInfo? _packageInfo;

  final _registerStateController = StreamController<RegisterState>();
  Stream<RegisterState> get registerStateStream =>
      _registerStateController.stream;


  late AccountingRepo _accountingRepo;

  RegisterState _registerState = RegisterState.NotSetYet;

  RegisterState get newState => _registerState;

  SplashModel() {
    getVersionInfo();
    _accountingRepo = AccountingRepo.getInstance();
    // checkPhoneRegisterState();
  }

  void checkPhoneRegisterState() {
    _accountingRepo.getRegisterState();
    _accountingRepo.registerStateStream.listen((registerState) {
      // this._registerState = registerState;
      // notifyListeners();
      _registerStateController.sink.add(registerState);
    });
  }

  // Stream getRegisterStateStream() {
  //   return _accountingRepo.registerStateStream;
  // }

  getVersionInfo() async {
    _packageInfo = await PackageInfo.fromPlatform();
    notifyListeners();
  }

  String get versionName => 'version: ${_packageInfo?.version}';

  void refreshVersion() {
    getVersionInfo();
  }

  closeButton()
  {
    _registerStateController.close();
  }

}
