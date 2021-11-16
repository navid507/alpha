import 'package:alpha/back/accounting/abstracts/accounting_api_abstract.dart';
import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:alpha/back/accounting/models/record/record_type_result.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';

import 'models/record/record.dart';
import 'models/record/record_result.dart';

class AccountingURLs {
  static const String _root = "http://orkaswim.ir/index.php/alpha_api/user";
  static const String RelatedSwimmers = "$_root/relativeswimmer";
  static const String RegisterPhone = "$_root/addphone";
  static const String Verify = "$_root/verify";
  static const String RegisterSwimmer = "$_root/register";
  static const String EditSwimmer = "$_root/profile";
  static const String RecordTypes = "$_root/record_type";
  static const String RecordOfUser = "$_root/record";

// Profile
}

class AccountingAPI implements AccountingApiInterface {
  HttpFunctionsInterface http;

  AccountingAPI({required this.http});

  @override
  Future<List<Swimmer>> findRelativeSwimmers({required String private}) async {
    List<Swimmer> swimmers = List.empty(growable: true);

    var res = await http.get(url: AccountingURLs.RelatedSwimmers);

    int err = res.state.error;
    if (err != 0) return swimmers;

    List<dynamic> swimmersJson = res.data;
    swimmersJson.forEach((element) {
      swimmers.add(Swimmer.fromJson(element));
    });

    return swimmers;
  }

  @override
  Future<StateResult> registerPhone(
      {required String phone, required String uid}) async {
    Map<String, dynamic> body = Map();
    body['phone'] = phone;
    body['uniq'] = uid;
    var res = await http.post(url: AccountingURLs.RegisterPhone, body: body);
    return res.state;
  }

  @override
  Future<APIResult> verifyPhone(
      {required String phone,
      required String uid,
      required String code}) async {
    Map<String, dynamic> body = Map();
    body['phone'] = phone;
    body['uniq'] = uid;
    body['code'] = code;

    var res = await http.post(url: AccountingURLs.Verify, body: body);
    return res;
  }

  @override
  Future<APIResult> registerUser({required Swimmer swimmer, required Map<String, String> files}) async {
    // var res = await http.get(url: AccountingURLs.RegisterSwimmer);
    var res = await http.multiPartPost(url: AccountingURLs.RegisterSwimmer, body: swimmer.toJson(), files: files);
    return res;
  }

  @override
  Future<StateResult> editUser({required Swimmer swimmer, required Map<String, String> files}) async {
    var res = await http.get(url: AccountingURLs.RegisterSwimmer);
    return res.state;
  }


  @override
  Future<RecordTypesResult> getRecordTypes() async {
    List<RecordType> records = List.empty(growable: true);

    var res = await http.get(url: AccountingURLs.RecordTypes);

    if (res.isSuccess) {
      List<dynamic> swimmersJson = res.data;
      swimmersJson.forEach((element) {
        records.add(RecordType.fromJson(element));
      });

      return RecordTypesResult.success(records);
    }
    return RecordTypesResult.error(res.state.error, res.state.msg);
  }


  @override
  Future<RecordsResult> getRecordOfUser(String userID, String type, String token) async {
    List<Record> records = List.empty(growable: true);

    Map<String, dynamic> body = Map();
    body['user_id'] = userID;
    body['type'] = type;
    body['private'] = token;

    // var res = await http.get(url: "${AccountingURLs.RecordOfUser}/$userID/$type/$token");
    var res = await http.post(url: AccountingURLs.RecordOfUser, body: body);

    if (res.isSuccess) {
      List<dynamic> recordsJson = res.data;
      recordsJson.forEach((element) {
        records.add(Record.fromJson(element));
      });

      return RecordsResult.success(records);
    }
    return RecordsResult.error(res.state.error, res.state.msg);
  }


/*
   @override
  registerUser(
      {required String code,
      required String phone,
      required String firstName,
      required String lastName,
      required String birthDate,
      required String homeAddress,
      required String homePhone,
      required String schoolAddress,
      required String schoolPhone,
      required String schoolRegion,
      required String fatherEducation,
      required String fatherJob,
      required String fatherPhone,
      required String motherEducation,
      required String motherJob,
      required String motherPhone,
      required String useService,
      required String reagent,
      required String introduction,
      required String userPosEdit,
      required String image,
      required String nationalImage,
      required String shenasImage,
      required String insuranceImage,
      required String eshtegalImage}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }
   */
}
