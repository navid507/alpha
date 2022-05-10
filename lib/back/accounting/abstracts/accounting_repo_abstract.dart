import 'package:alpha/back/accounting/models/record/record_result.dart';
import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:provider/provider.dart';

enum RegisterState {
  Nothing,
  Phone,
  // Verify,
  // Code,
  OK,
  // Relative_User,
  NotSetYet
}

abstract class AccountingRepositoryInterface {
  int get userID;

  Stream<RegisterState> get registerStateStream;

  Future<String> get token;

  Stream get activeSwimmerStream;

  // getRegisterState();

  Future<StateResult> registerPhone(String phone);

  Future<StateResult> verifyPhone(String code);

  updateFirebaseToken();

  updateActiveSwimmer();

  dispose();

  Future<List<Swimmer>?> updateRelatedSwimmers();

  resetRegisterState();

  changeActiveSwimmer(Swimmer swimmer);

  Future<Swimmer?> getActiveSwimmer();

  Future<RegisterState> getRegisterState();

  Future<StateResult> addSwimmer(Swimmer swimmer);
  Future<StateResult> editSwimmer(Swimmer swimmer);

  Future<RecordsResult> getAllRecordsOf(RecordType recordType);

}
