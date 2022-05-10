import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmers_result.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class ChangeUserModel extends ChangeNotifier {
  late AccountingRepositoryInterface _accountingRepo;

  final _connectedSwimmersController = StreamController<SwimmersResult>();

  Stream<SwimmersResult> get connectedSwimmersStream =>
      _connectedSwimmersController.stream;

  SwimmersResult get getConnectedSwimmer => connectedSwimmers;

  SwimmersResult connectedSwimmers =
      SwimmersResult.success([Swimmer.emptySwimmer()]);

  // SwimmersResult connectedSwimmers = SwimmersResult.error(-1, 'not yet loaded');
  String error = "";
  Swimmer? activeSwimmer;

  ChangeUserModel() {
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData(deviceInfo: DeviceInfoPlugin()));
  }

  getConnectedSwimmers() async {
    error = '';
    connectedSwimmers = SwimmersResult.error(3, 'not yet loaded');
    notifyListeners();

    _connectedSwimmersController.sink.add(connectedSwimmers);

    _accountingRepo.updateRelatedSwimmers().asStream().listen((result) {
      if (result != null) {
        connectedSwimmers = SwimmersResult.success(result);
        _accountingRepo.getActiveSwimmer().then((value) {
          activeSwimmer = value;
          notifyListeners();
          return;
        });
      } else {
        connectedSwimmers = SwimmersResult.error(-2, 'no swimmers found');
      }
      _connectedSwimmersController.sink.add(connectedSwimmers);
      notifyListeners();
    });
  }

  changeActiveSwimmer(Swimmer swimmer) {
    _accountingRepo.changeActiveSwimmer(swimmer);
    getConnectedSwimmers();
  }

  @override
  void dispose() {
    _connectedSwimmersController.close();
    super.dispose();
  }
}
