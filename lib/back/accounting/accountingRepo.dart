import 'package:alpha/back/accounting/accountingApiAbstract.dart';
import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/main_functions/http_functions.dart';
import 'package:http/http.dart' as http;

class URLs {
  static const String _root = "http://orkaswim.ir/index.php/alpha_api/user";
  static const String RelatedSwimmers = "$_root/relativeswimmer";
  static const String Register = "$_root/register";

// Profile
}

class AccountingAPI implements AccountingApiInterface {
  HttpFunctionsInterface http;

  AccountingAPI({required this.http});

  @override
  Future<List<Swimmer>> findRelativeSwimmers(
      {required String private, required String fbToken}) async {
    List<Swimmer> swimmers = List.empty(growable: true);

    var res = await http.get(url: URLs.RelatedSwimmers);

    int err = res['error'];
    if (err != 0) return swimmers;

    List<Map<String, dynamic>> swimmersJson = res['swimmers'];
    swimmersJson.forEach((element) {
      swimmers.add(Swimmer.fromJson(element));
    });

    return swimmers;
  }

  @override
  registerPhone({required String phone, required String uid}) {}

  @override
  verifyPhone({required String phone, required String uid}) {
    // TODO: implement verifyPhone
    throw UnimplementedError();
  }

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
}

class AccountingRepo {}

extension on AccountingRepo {}
