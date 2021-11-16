import 'dart:ffi';

import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

enum RegisterState { Nothing, Phone, Verify, Code, OK, Relative_User, NotSetYet }

abstract class AccountingRepositoryInterface {

  getRegisterState();
  Future<StateResult> registerPhone(String phone);
  Future<StateResult> verifyPhone(String code);


  updateActiveSwimmer();

  updateRelatedSwimmers();
}