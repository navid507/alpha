import 'package:alpha/back/accounting/models/record/record_result.dart';
import 'package:alpha/back/accounting/models/record/record_type_result.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmers_result.dart';
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

  Future<APIResult> registerUser({required Swimmer swimmer});

  Future<APIResult> editUser({required Swimmer swimmer});

  Future<SwimmersResult> findRelativeSwimmers({required String private}); //

  Future<RecordTypesResult> getRecordTypes();

  Future<RecordsResult> getRecordOfUser(
      String userID, String type, String token);
}
