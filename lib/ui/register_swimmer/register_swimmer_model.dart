import 'dart:async';
import 'dart:io';

import 'package:alpha/back/accounting/abstracts/accounting_repo_abstract.dart';
import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/user_stored_data.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/register_swimmer/register_swimmer_dialog.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterSwimmerModel extends ChangeNotifier {
  late AccountingRepositoryInterface _accountingRepo;
  late Swimmer swimmer;
  DialogState dialogState = DialogState.normal;
  String error = '';

  final _registerSwimmerStateController = StreamController<StateResult>();

  Stream<StateResult> get registerSwimmerStateStream =>
      _registerSwimmerStateController.stream;

  doRegister(Swimmer curSwimmer) {
    curSwimmer.melliImageFile = swimmer.melliImageFile;
    curSwimmer.profileImageFile = swimmer.profileImageFile;
    curSwimmer.idImageFile = swimmer.idImageFile;
    curSwimmer.educationImageFile = swimmer.educationImageFile;
    curSwimmer.insuranceImageFile = swimmer.insuranceImageFile;

    dialogState = DialogState.loading;
    notifyListeners();

    if (swimmer.id == -1) {
      _accountingRepo.addSwimmer(curSwimmer).then((result) {
        if (result.isSuccess) {
          dialogState = DialogState.finish;
          _registerSwimmerStateController.sink.add(result);
        } else {
          dialogState = DialogState.serverError;
          error = result.msg;
          notifyListeners();
        }
      });
    } else {
      _accountingRepo.editSwimmer(curSwimmer).then((result) {
        if (result.isSuccess) {
          dialogState = DialogState.finish;
          _registerSwimmerStateController.sink.add(result);
        } else {
          dialogState = DialogState.serverError;
          error = result.msg;
          notifyListeners();
        }
      });
    }
  }

  String get firstName => swimmer.firstName;

  String get lastName => swimmer.lastName;

  String get birthDate => swimmer.birthDate;

  String get code => swimmer.code;

  String get phone => swimmer.phone;

  String get homeAddress => swimmer.homeAddress;

  String get homePhone => swimmer.homePhone;

  String get schoolAddress => swimmer.schoolAddress;

  String get schoolPhone => swimmer.schoolPhone;

  String get schoolRegion => swimmer.schoolRegion;

  String get fatherEducation => swimmer.fatherEducation;

  String get fatherJob => swimmer.fatherJob;

  String get fatherPhone => swimmer.fatherPhone;

  String get motherEducation => swimmer.motherEducation;

  String get motherJob => swimmer.motherJob;

  String get motherPhone => swimmer.motherPhone;

  String get useService => swimmer.useService;

  String get reagent => swimmer.reagent;

  String get image => swimmer.image;

  String get nationalImage => swimmer.nationalImage;

  String get shenasImage => swimmer.shenasImage;

  String get insuranceImage => swimmer.insuranceImage;

  String get eshtegalImage => swimmer.eshtegalImage;

  String get familiarity => swimmer.familiarity;

  AlphaImageSource profileSource = AlphaImageSource.Asset;
  AlphaImageSource melliSource = AlphaImageSource.Asset;
  AlphaImageSource idSource = AlphaImageSource.Asset;
  AlphaImageSource insuranceSource = AlphaImageSource.Asset;
  AlphaImageSource educationSource = AlphaImageSource.Asset;

  RegisterSwimmerModel({required this.swimmer}) {
    _accountingRepo = AccountingRepo.getInstance(
        userStoredData: UserStoredData());
  }

  getProfileImage() {
    if (swimmer.profileImageFile != null) {
      profileSource = AlphaImageSource.Local;
      print('profile image for $profileSource: ${swimmer.profileImageFile}');

      return Image.file(
        File(swimmer.profileImageFile!.path),
        fit: BoxFit.fill,
      );
    }
    if (swimmer.image.isNotEmpty) {
      profileSource = AlphaImageSource.Server;
      print('profile image for $profileSource: ${swimmer.profileImageFile}');
      return Image.network(swimmer.image);
    }
    print('profile image for $profileSource: ${swimmer.profileImageFile}');
    return Image.asset('assets/images/im_upload.png');
  }

  getMelliImage() {
    if (swimmer.melliImageFile != null) {
      melliSource = AlphaImageSource.Local;
      return Image.file(
        File(swimmer.melliImageFile!.path),
      );
    }
    if (swimmer.nationalImage.isNotEmpty) {
      melliSource = AlphaImageSource.Server;
      return Image.network(swimmer.nationalImage);
    }
    return Image.asset('assets/images/im_upload.png');
  }

  getIDImage() {
    if (swimmer.idImageFile != null) {
      idSource = AlphaImageSource.Local;
      return Image.file(
        File(swimmer.idImageFile!.path),
      );
    }
    if (swimmer.shenasImage.isNotEmpty) {
      idSource = AlphaImageSource.Server;
      return Image.network(swimmer.shenasImage);
    }
    return Image.asset('assets/images/im_upload.png');
  }

  getInsuranceImage() {
    if (swimmer.insuranceImageFile != null) {
      insuranceSource = AlphaImageSource.Local;
      return Image.file(
        File(swimmer.insuranceImageFile!.path),
      );
    }
    if (swimmer.insuranceImage.isNotEmpty) {
      insuranceSource = AlphaImageSource.Server;
      return Image.network(swimmer.insuranceImage);
    }
    return Image.asset('assets/images/im_upload.png');
  }

  getEducationImage() {
    if (swimmer.educationImageFile != null) {
      educationSource = AlphaImageSource.Local;
      return Image.file(
        File(swimmer.educationImageFile!.path),
        fit: BoxFit.fill,
      );
    }
    if (swimmer.eshtegalImage.isNotEmpty) {
      educationSource = AlphaImageSource.Server;
      return Image.network(swimmer.eshtegalImage);
    }
    return Image.asset('assets/images/im_upload.png');
  }

  setImageProfile({required XFile? pickedFile}) {
    swimmer.image = '';
    swimmer.profileImageFile = pickedFile;
  }

  deleteImageProfile() {
    swimmer.profileImageFile = null;
    swimmer.image = '';
    profileSource = AlphaImageSource.Asset;
  }

  setImageMelli({required XFile? pickedFile}) {
    swimmer.image = '';
    swimmer.melliImageFile = pickedFile;
  }

  deleteImageMelli() {
    swimmer.melliImageFile = null;
    swimmer.nationalImage = '';
    melliSource = AlphaImageSource.Asset;
  }

  setImageId({required XFile? pickedFile}) {
    swimmer.image = '';
    swimmer.idImageFile = pickedFile;
  }

  deleteImageId() {
    swimmer.idImageFile = null;
    swimmer.shenasImage = '';
    idSource = AlphaImageSource.Asset;
  }

  setImageEducation({required XFile? pickedFile}) {
    swimmer.image = '';
    swimmer.educationImageFile = pickedFile;
  }

  deleteImageEducation() {
    swimmer.educationImageFile = null;
    swimmer.eshtegalImage = '';
    educationSource = AlphaImageSource.Asset;
  }

  setImageInsurance({required XFile? pickedFile}) {
    swimmer.image = '';
    swimmer.insuranceImageFile = pickedFile;
  }

  deleteImageInsurance() {
    swimmer.insuranceImageFile = null;
    swimmer.insuranceImage = '';
    insuranceSource = AlphaImageSource.Asset;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _registerSwimmerStateController.close();
    super.dispose();
  }
}
