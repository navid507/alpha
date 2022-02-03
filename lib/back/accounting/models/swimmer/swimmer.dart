import 'dart:core';

import 'package:image_picker/image_picker.dart';

class Swimmer {
  String sid = "-1";
  String code = "";
  String phone = "";
  String firstName = "";
  String lastName = "";
  String birthDate = "";
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
  String? score = "0";
  String reagent = "";
  String image = "";
  String nationalImage = "";
  String shenasImage = "";
  String insuranceImage = "";
  String eshtegalImage = "";
  String familiarity = "";
  bool isActive = false;
  bool isLoading = false;

  String familiarityType = '0';

  int get id => int.parse(sid);

  XFile? profileImageFile;
  XFile? melliImageFile;
  XFile? idImageFile;
  XFile? insuranceImageFile;
  XFile? educationImageFile;

  factory Swimmer.emptySwimmer() {
    return Swimmer(
        sid: '-1',
        code: '0941959384',
        phone: '09155101452',
        firstName: 'test name',
        lastName: 'test family',
        birthDate: '1360/02/20',
        homeAddress: 'sanabad',
        homePhone: '05137601101',
        schoolAddress: '',
        schoolPhone: '',
        schoolRegion: '',
        fatherEducation: '',
        fatherJob: '',
        fatherPhone: '09366743096',
        motherEducation: '',
        motherJob: '',
        motherPhone: '09366743096',
        useService: '',
        reagent: '',
        image: '',
        score: '',
        nationalImage: '',
        shenasImage: '',
        insuranceImage: '',
        eshtegalImage: '',
        familiarity: '');
  }

  Swimmer(
      {required this.sid,
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
      this.score,
      required this.reagent,
      required this.image,
      required this.nationalImage,
      required this.shenasImage,
      required this.insuranceImage,
      required this.eshtegalImage,
      required this.familiarity});

  factory Swimmer.fromJson(Map<String, dynamic> json) {
    return Swimmer(
        sid: json['id'],
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
        familiarity: json['introduction'],
        image: json['image'],
        nationalImage: json['national_image'],
        shenasImage: json['shenas_image'],
        insuranceImage: json['insurance_image'],
        eshtegalImage: json['eshtegal_image']);
  }

  Map<String, String> toJsonFiles() {
    Map<String, String> files = Map();
    if (profileImageFile != null) {
      files['image'] = profileImageFile!.path;
    }
    if (idImageFile != null) {
      files['shenas_image'] = idImageFile!.path;
    }
    if (melliImageFile != null) {
      files['national_image'] = melliImageFile!.path;
    }
    if (educationImageFile != null) {
      files['eshtegal_image'] = educationImageFile!.path;
    }
    if (insuranceImageFile != null) {
      files['insurance_image'] = insuranceImageFile!.path;
    }
    return files;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': sid,
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
      // 'score': score,
      'reagent': reagent,
      'introduction': familiarityType,
      // 'image': image,
      // 'national_image': nationalImage,
      // 'shenas_image': shenasImage,
      // 'insurance_image': insuranceImage,
      // 'eshtegal_image': eshtegalImage,
    };
  }

  String get fullName => "$firstName $lastName";
}
