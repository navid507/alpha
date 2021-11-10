import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

abstract class AccountingApiInterface {
  /*
  phone, uniq
   */
  Future<StateResult> registerPhone({
    required String phone, // phone
    required String uid, // uniq
  }); //
  /*
  phone, code, uniq
   */
  Future<APIResult> verifyPhone({
    required String phone,
    required String uid,
    required String code,

  });

  Future<APIResult> registerUser({required Swimmer swimmer, required Map<String, String> files});


  Future<StateResult> editUser({required Swimmer swimmer, required Map<String, String> files});

  Future<List<Swimmer>> findRelativeSwimmers({
    required String private
  }); //

}
