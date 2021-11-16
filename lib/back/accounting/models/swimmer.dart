import 'dart:core';

class Swimmer {
  int id = -1;
  String code = "";
  String phone = "";
  String firstName = "";
  String lastName = "";
  String birthDate = "";

  // String regDate = "";
  String homeAddress = "";
  String homePhone = "";
  String schoolAddress = "";
  String schoolPhone = "";
  String schoolRegion = "";
  String fatherEducation = "";
  String fatherJob = "";
  String fatherPhone = "";
  String motherEducation = "";
  String motherJob = "";
  String motherPhone = "";
  String useService = "";
  String score = "0";
  String reagent = "";
  String image = "";
  String nationalImage = "";
  String shenasImage = "";
  String insuranceImage = "";
  String eshtegalImage = "";
  String introduction = "";

  Swimmer(
      {required this.id,
      required this.code,
      required this.phone,
      required this.firstName,
      required this.lastName,
      required this.birthDate,
      // required this.regDate,
      required this.homeAddress,
      required this.homePhone,
      required this.schoolAddress,
      required this.schoolPhone,
      required this.schoolRegion,
      required this.fatherEducation,
      required this.fatherJob,
      required this.fatherPhone,
      required this.motherEducation,
      required this.motherJob,
      required this.motherPhone,
      required this.useService,
      required this.score,
      required this.reagent,
      required this.image,
      required this.nationalImage,
      required this.shenasImage,
      required this.insuranceImage,
      required this.eshtegalImage,
      required this.introduction});

  factory Swimmer.fromJson(Map<String, dynamic> json) {
    return Swimmer(
        id: json['id'],
        code: json['code'],
        phone: json['phone'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        birthDate: json['birth_date'],
        homeAddress: json['home_address'],
        homePhone: json['home_phone'],
        schoolAddress: json['school_address'],
        schoolPhone: json['school_phone'],
        schoolRegion: json['school_region'],
        fatherEducation: json['school_region'],
        fatherJob: json['father_job'],
        fatherPhone: json['father_phone'],
        motherEducation: json['mother_education'],
        motherJob: json['mother_job'],
        motherPhone: json['mother_phone'],
        useService: json['use_service'],
        score: json['score'],
        reagent: json['reagent'],
        introduction: json['introduction'],
        image: json['image'],
        nationalImage: json['national_image'],
        shenasImage: json['shenas_image'],
        insuranceImage: json['insurance_image'],
        eshtegalImage: json['eshtegal_image']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'birth_date': birthDate,
      'home_address': homeAddress,
      'home_phone': homePhone,
      'school_address': schoolAddress,
      'school_phone': schoolPhone,
      'school_region': schoolRegion,
      'father_education': fatherEducation,
      'father_job': fatherJob,
      'father_phone': fatherPhone,
      'mother_education': motherEducation,
      'mother_job': motherJob,
      'mother_phone': motherPhone,
      'use_service': useService,
      'score': score,
      'reagent': reagent,
      'introduction': introduction,
      'image': image,
      'national_image': nationalImage,
      'shenas_image': shenasImage,
      'insurance_image': insuranceImage,
      'eshtegal_image': eshtegalImage
    };
  }
}
