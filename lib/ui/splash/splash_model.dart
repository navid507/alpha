import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashModelPhoneState extends ChangeNotifier {}

class SplashModel extends ChangeNotifier {
  PackageInfo? _packageInfo;

  final _registerStateController = StreamController<RegisterState>();

  Stream<RegisterState> get registerStateStream =>
      _registerStateController.stream;

  late AccountingRepositoryInterface? _accountingRepo;

  RegisterState _registerState = RegisterState.NotSetYet;

  RegisterState get newState => _registerState;

  SplashModel() {
    getVersionInfo();
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData(deviceInfo: DeviceInfoPlugin()));

    // checkPhoneRegisterState();
  }

  Future<bool> initFirebase() async {
    // await Firebase.initializeApp();
    _accountingRepo!.updateFirebaseToken();
    return true;
  }

  void checkPhoneRegisterState() {
    // _accountingRepo!.getRegisterState();
    _accountingRepo!.getRegisterState().asStream().listen((registerState) {
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

  closeButton() {
    _registerStateController.close();
  }
}
