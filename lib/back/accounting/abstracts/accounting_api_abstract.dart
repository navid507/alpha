import 'package:alpha/back/accounting/models/swimmer.dart';

abstract class AccountingApiInterface {
  /*
  phone, uniq
   */
  Future<int> registerPhone({
    required String phone, // phone
    required String uid, // uniq
  }); //
  /*
  phone, code, uniq
   */
  Future<int> verifyPhone({
    required String phone,
    required String uid,
  });

  Future<int> registerUser({required Swimmer swimmer});

  Future<List<Swimmer>> findRelativeSwimmers({
    required String private, // private
    required String fbToken, // pusheID
  }); //

}
