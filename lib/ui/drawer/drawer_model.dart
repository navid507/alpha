import 'dart:async';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer_result.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DrawerModel extends ChangeNotifier {
  final _registerStateController = StreamController<RegisterState>();
  late StreamSubscription registerStateSubscription;

  Stream get registerStateStream => _registerStateController.stream;

  late AccountingRepositoryInterface
      _accountingRepo; // = AccountingRepo.getInstance();
  RegisterState registerState = RegisterState.NotSetYet;

  SwimmerResult activeSwimmer = SwimmerResult.error(11, 'Not Assigned');
  // LoadingState activeSwimmerLoadingState = Loading

  DrawerModel() {
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData());

    registerStateSubscription =
        _accountingRepo.registerStateStream.listen((registerState) {
      this.registerState = registerState;
    });

    _accountingRepo.activeSwimmerStream.listen((activeSwimmer) {
      this.activeSwimmer = SwimmerResult.success(activeSwimmer);
      notifyListeners();
    });
  }

  getActiveSwimmer() {
    _accountingRepo.getActiveSwimmer().asStream().listen((swimmer) {
      if (swimmer != null) {
        activeSwimmer = SwimmerResult.success(swimmer);
      } else {
        activeSwimmer = SwimmerResult.error(-10, 'No Swimmer');
      }
      notifyListeners();
    });
  }

  getRegisterState() async {
    registerState = await _accountingRepo.getRegisterState();
    notifyListeners();
  }

  resetRegisterState() async {
    await _accountingRepo.resetRegisterState();
  }

  @override
  void dispose() {
    registerStateSubscription.cancel();
    _registerStateController.close();
    // accountingRepo.dispose();
    // accountingRepo.÷activeSwimmerStream.di
    super.dispose();
  }
}
