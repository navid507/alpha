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
  FutureverifyPhone({
    required String phone,
    required String uid,
  });

  registerUser(
      {required String code,
      required String phone,
      required String firstName, //first_name
      required String lastName, //last_name
      required String birthDate, //birth_date
      required String homeAddress, //home_address
      required String homePhone, //home_phone
      required String schoolAddress, //school_address
      required String schoolPhone, //school_phone
      required String schoolRegion, //school_region
      required String fatherEducation, //school_region
      required String fatherJob, //father_job
      required String fatherPhone, //father_phone
      required String motherEducation, //mother_education
      required String motherJob, //mother_job
      required String motherPhone, //mother_phone
      required String useService, //use_service
      required String reagent, //reagent
      required String introduction, //introduction
      required String userPosEdit, //user_pos_edit
      required String image, //image
      required String nationalImage, //image national_image pic
      required String shenasImage, //shenas_image
      required String insuranceImage, //insurance_image
      required String eshtegalImage //eshtegal_image
      });

  Future<List<Swimmer>> findRelativeSwimmers({
    required String private, // private
    required String fbToken, // pusheID
  }); //

}
