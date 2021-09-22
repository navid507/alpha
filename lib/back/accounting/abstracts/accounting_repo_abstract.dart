import 'dart:ffi';

import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';

enum RegisterState { Nothing, Phone, Verify, Code, OK, Relative_User }

abstract class AccountingRepositoryInterface {
  getRegisterStateStream();

  getActiveSwimmerStream();

  getRelatedSwimmerStream();
}
