
import 'package:alpha/main_functions/main_models/api_result.dart';

enum RegisterState { Nothing, Phone, Verify, Code, OK, Relative_User, NotSetYet }

abstract class AccountingRepositoryInterface {

  int get userID;
  String get token;

  getRegisterState();
  Future<StateResult> registerPhone(String phone);
  Future<StateResult> verifyPhone(String code);


  updateActiveSwimmer();

  updateRelatedSwimmers();
}