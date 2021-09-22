
import 'package:alpha/back/accounting/abstracts/accounting_api_abstract.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/main_functions/http_functions.dart';


class AccountingURLs {
  static const String _root = "https://orkaswim.ir/index.php/alpha_api/user";
  static const String RelatedSwimmers = "$_root/relativeswimmer";
  static const String RegisterPhone = "$_root/addphone";
  static const String Verify = "$_root/verify";
  static const String RegisterSwimmer = "$_root/register";

// Profile
}

class AccountingAPI implements AccountingApiInterface {
  HttpFunctionsInterface http;

  AccountingAPI({required this.http});

  @override
  Future<List<Swimmer>> findRelativeSwimmers(
      {required String private, required String fbToken}) async {
    List<Swimmer> swimmers = List.empty(growable: true);

    var res = await http.get(url: AccountingURLs.RelatedSwimmers);

    int err = res.state.error;
    if (err != 0) return swimmers;

    List<Map<String, dynamic>> swimmersJson = res.data;
    swimmersJson.forEach((element) {
      swimmers.add(Swimmer.fromJson(element));
    });

    return swimmers;
  }

  @override
  Future<int> registerPhone(
      {required String phone, required String uid}) async {
    var res = await http.get(url: AccountingURLs.RegisterPhone);
    return res.state.error;
  }

  @override
  Future<int> verifyPhone({required String phone, required String uid}) async {
    var res = await http.get(url: AccountingURLs.Verify);
    return res.state.error;
  }

  @override
  Future<int> registerUser({required Swimmer swimmer}) async {
    var res = await http.get(url: AccountingURLs.RegisterSwimmer);
    return res.state.error;
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