import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/alpha_text_field.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/register_swimmer/register_swimmer_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:provider/provider.dart';

enum UploadType { Profile, Melli, Id, Education, Insurance }
enum AlphaImageSource { Asset, Local, Server }

class RegisterSwimmerDialog extends StatefulWidget {
  RegisterSwimmerDialog({Key? key}) : super(key: key);

  @override
  _RegisterSwimmerDialogState createState() => _RegisterSwimmerDialogState();
}

class _RegisterSwimmerDialogState extends State<RegisterSwimmerDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setInitialValue();
      model.registerSwimmerStateStream.listen((registerState) {
        if (model.dialogState == DialogState.finish) {
          Navigator.pop(context, registerState);
        }
      });
    });
  }

  RegisterSwimmerModel get model =>
      Provider.of<RegisterSwimmerModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey, child: getRegisterFormContainer());
  }

  late AlphaHeader alphaHeader;

  getRegisterFormContainer() {
    alphaHeader = AlphaHeader(drawerContext: context);
    var screenHeight = getScreenHeight(context);
    return Container(
      width: getScreenWidth(context),
      color: AlphaColors.background,
      child: ListView(
        children: [
          Stack(children: [
            SizedBox(
              width: getScreenWidth(context),
              height: 0.25 * screenHeight,
              child: Opacity(
                  opacity: 0.25,
                  child: Image.asset(
                    'assets/images/header_swimmer.png',
                    fit: BoxFit.fill,
                  )),
            ),
            Column(children: [
              alphaHeader.getTopHeader(),
              getAvatarImageRegisterForm(
                  'assets/images/ic_menu_profile_unselected.png')
            ])
          ]),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: getSelectorRegisterForm(),
          )
        ],
      ),
    );
  }

  getSelectorRegisterForm() {
    return Selector<RegisterSwimmerModel, DialogState>(
        selector: (_, modelDialog) => modelDialog.dialogState,
        builder: (_, dialogState, ___) {
          return getRegisterForm(dialogState);
        });
  }

  getRegisterForm(DialogState state) {
    return Column(children: [
      getHeaderSection(text: getAppLocalization(context).registerSwimmerForm),
      getRowSection(
          hint: getAppLocalization(context).swimmerName,
          controller: swimmerNameTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
            if (!isNameValid(text)) {
              return getAppLocalization(context).pleaseEnterValid;
            }
          }),
      getRowSection(
          hint: getAppLocalization(context).swimmerFamily,
          controller: swimmerFamilyTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
          }),
      getRowSectionDate(
          hint: getAppLocalization(context).birthdate,
          controller: swimmerBDTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
          }),
      getRowSection(
          hint: getAppLocalization(context).nationalCode,
          controller: swimmerNationalCodeTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
            if (!isNationalCodeValid(text)) {
              return getAppLocalization(context).pleaseEnterValid;
            }
          }),
      getRowSection(
          hint: getAppLocalization(context).phoneNumber,
          controller: swimmerPhoneTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
            if (!isPhoneValid(text)) {
              return getAppLocalization(context).pleaseEnterValid;
            }
          }),
      getRowSection(
          hint: getAppLocalization(context).tel,
          controller: swimmerTelTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
            if (!isTelValid(text)) {
              return getAppLocalization(context).pleaseEnterValid;
            }
          }),
      getRowSection(
          hint: getAppLocalization(context).address,
          controller: swimmerAddressTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
            if (!isNameValid(text)) {
              return getAppLocalization(context).pleaseEnterValid;
            }
          }),
      getHeaderSection(text: getAppLocalization(context).schoolInfo),
      getRowSection(
          hint: getAppLocalization(context).tel, controller: schoolPhoneTC),
      getRowSection(
          hint: getAppLocalization(context).schoolRegion,
          controller: schoolRegionTC),
      getRowSection(
          hint: getAppLocalization(context).schoolAddr,
          controller: schoolAddressTC),
      getHeaderSection(text: getAppLocalization(context).fatherInfo),
      getRowSection(
          hint: getAppLocalization(context).fatherEducation,
          controller: fatherEducationTC),
      getRowSection(
          hint: getAppLocalization(context).fatherJob, controller: fatherJobTC),
      getRowSection(
          hint: getAppLocalization(context).fatherPhone,
          controller: fatherPhoneTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
            if (!isTelValid(text)) {
              return getAppLocalization(context).pleaseEnterValid;
            }
          }),
      getHeaderSection(text: getAppLocalization(context).motherInfo),
      getRowSection(
          hint: getAppLocalization(context).motherEducation,
          controller: motherEducationTC),
      getRowSection(
          hint: getAppLocalization(context).motherJob, controller: motherJobTC),
      getRowSection(
          hint: getAppLocalization(context).motherPhone,
          controller: motherPhoneTC,
          validator: (text) {
            if (text!.isEmpty)
              return getAppLocalization(context).pleaseFillTheField;
            if (!isTelValid(text)) {
              return getAppLocalization(context).pleaseEnterValid;
            }
          }),
      getHeaderSection(text: getAppLocalization(context).addedInfo),
      getRowSection(
          hint: getAppLocalization(context).introducer,
          controller: introducerTC),
      getFamiliarityDropDown(
          hint: getAppLocalization(context).familiarity,
          controller: familiarityTC),
      getServiceCheckBox(),
      getHeaderSection(text: getAppLocalization(context).uploadFiles),
      getUploadSectionFirstRow(),
      getUploadSectionSecondRow(),
      getDialogBased(state)
    ]);
  }

  getDialogBased(DialogState state) {
    switch (state) {
      case DialogState.normal:
        return Column(
          children: [getOk(), getCancel()],
        );
      case DialogState.loading:
        return getLoading();
      case DialogState.formError:
        return Column(
          children: [
            getOk(),
            getError(getAppLocalization(context).generalDialogError),
            getCancel()
          ],
        );
      case DialogState.serverEroor:
        return Column(
          children: [getOk(), getError(model.error), getCancel()],
        );
    }
  }

  getError(String text) {
    return getAlphaTextErrorEditText(text);
  }

  getLoading() {
    return Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: AlphaColors.Yellow,
            strokeWidth: 1,
          ),
          height: 15,
          width: 15,
        ));
  }

  getOk() {
    return Container(
      color: AlphaColors.background,
      child: getAlphaDialogButtonOk(
          text: getAppLocalization(context).register, onPressed: onRegister),
      width: getScreenWidth(context),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    );
  }

  getCancel() {
    return Container(
        child: getAlphaDialogButtonCancel(
            text: getAppLocalization(context).cancel, onPressed: onCancel),
        width: getScreenWidth(context),
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8));
  }

  onCancel() {
    Navigator.of(context).pop();
  }

  onRegister() {
    if (_formKey.currentState!.validate()) {
      model.doRegister(createSwimmerFromForm());
    } else {
      setState(() {
        model.dialogState = DialogState.formError;
      });
    }
  }

  getUploadSectionFirstRow() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          children: [
            getUploadElement(
                text: getAppLocalization(context).profileImage,
                image: getProfileImage(),
                imageSource: model.profileSource,
                onTap: () {
                  selectProfileImage();
                },
                onDeleteTap: () {
                  deleteProfileImage();
                }),
            getUploadElement(
                text: getAppLocalization(context).melliImage,
                imageSource: model.melliSource,
                onTap: () {
                  selectMelliImage();
                },
                image: getMelliImage(),
                onDeleteTap: () {
                  deleteMelliImage();
                }),
            getUploadElement(
                imageSource: model.idSource,
                text: getAppLocalization(context).shenasnameImage,
                onTap: () {
                  selectIdImage();
                },
                image: getIDImage(),
                onDeleteTap: () {
                  deleteIdImage();
                })
          ],
        ));
  }

  getUploadSectionSecondRow() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Row(
          children: [
            getUploadElement(
                text: getAppLocalization(context).insuarnaceImage,
                image: getInsuranceImage(),
                imageSource: model.insuranceSource,
                onTap: () {
                  selectInsuranceImage();
                },
                onDeleteTap: () {
                  deleteInsuranceImage();
                }),
            getUploadElement(
                text: getAppLocalization(context).studentCertificate,
                imageSource: model.educationSource,
                onTap: () {
                  selectEducationImage();
                },
                image: getEducationImage(),
                onDeleteTap: () {
                  deleteEducationImage();
                })
          ],
        ));
  }

  getUploadElement(
      {required String text,
      required Image image,
      required AlphaImageSource imageSource,
      GestureTapCallback? onTap,
      GestureTapCallback? onDeleteTap}) {
    var widthRow = getScreenWidth(context) / 3 - 20;
    return GestureDetector(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            child: Container(
              width: widthRow,
              height: widthRow + 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AlphaColors.backDialog,
                  borderRadius: BorderRadius.circular(12.0)),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                      width: widthRow, height: widthRow - 10, child: image),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        getDeleteButton(
                            isVisible: imageSource != AlphaImageSource.Asset,
                            onTap: onDeleteTap),
                        Spacer(),
                        getAlphaTextBodyWhite(text)
                      ],
                    ),
                  )
                ],
              ),
            )),
        onTap: onTap);
  }

  getImage() async {
    try {
      XFile? pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery, maxHeight: 400, maxWidth: 400);
      return pickedFile;
    } catch (e) {
      print("Exception getImage, ${e.toString()}");
      return null;
    }
  }

  getDeleteButton({required bool isVisible, GestureTapCallback? onTap}) {
    return Visibility(
      child: GestureDetector(
        child: Icon(
          Icons.delete,
          color: AlphaColors.Red,
          size: 24,
        ),
        onTap: onTap,
      ),
      visible: isVisible,
    );
  }

  getEditButton({required bool isVisible, GestureTapCallback? onTap}) {
    return Visibility(
      child: GestureDetector(
        child: Icon(
          Icons.edit,
          color: AlphaColors.White,
          size: 24,
        ),
        onTap: () {},
      ),
      visible: isVisible,
    );
  }

  bool useService = false;

  getServiceCheckBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        getAlphaTextBodyWhite(getAppLocalization(context).usingService),
        Checkbox(
            fillColor: MaterialStateProperty.resolveWith((states) {
              if ((states.contains(MaterialState.selected))) {
                return AlphaColors.backDialog;
              } else {
                return AlphaColors.backDrawer;
              }
            }),
            value: useService,
            onChanged: (newValue) {
              if (newValue != null) useService = newValue;
              setState(() {});
            })
      ]),
    );
  }

  getFamiliarityDropDown(
      {required String hint, required TextEditingController controller}) {
    return Container(
        width: getScreenWidth(context),
        color: AlphaColors.backFormSection,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Column(
          children: [
            getAlphaTextTitleEditText(hint),
            Stack(
              children: [
                getAlphaTextFormFieldNormal(
                    hint: hint, textEditingController: controller),
                Container(
                  child: DropdownButton<String>(
                    items: <String>[
                      getAppLocalization(context).socialMedia,
                      getAppLocalization(context).swimmers,
                      getAppLocalization(context).visitor,
                      getAppLocalization(context).coach,
                      getAppLocalization(context).other
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: getAlphaTextTitle1White(value),
                      );
                    }).toList(),
                    onChanged: (String? fam) {
                      if (fam != null) familiarityTC.text = fam;
                    },
                    dropdownColor: AlphaColors.backDialog,
                  ),
                  width: getScreenWidth(context),
                )
              ],
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }

  getRowSection(
      {required String hint,
      FormFieldValidator<String>? validator,
      required TextEditingController controller}) {
    return Container(
        color: AlphaColors.backRegisterForm,
        width: getScreenWidth(context),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Column(
          children: [
            getAlphaTextTitleEditText(hint),
            getAlphaTextFormFieldNormalForm(
                validator: validator,
                hint: hint,
                textEditingController: controller)
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }

  Jalali? selectedBirthdate;

  getDatePicker() {
    var beginDate = Jalali.now().withYear(Jalali.now().year - 20);
    var lastDate = Jalali.now().withYear(Jalali.now().year - 3);
    showPersianDatePicker(
      context: context,
      initialDate: (selectedBirthdate != null) ? selectedBirthdate! : lastDate,
      firstDate: beginDate,
      lastDate: lastDate,
    ).then((pickedDate) {
      selectedBirthdate = pickedDate;
      swimmerBDTC.text =
          "${pickedDate!.year}/${pickedDate.month}/${pickedDate.day}";
      //do whatever you want
    });
  }

  getRowSectionDate(
      {required String hint,
      FormFieldValidator<String>? validator,
      required TextEditingController controller}) {
    return Container(
        color: AlphaColors.backRegisterForm,
        width: getScreenWidth(context),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        child: Column(
          children: [
            getAlphaTextTitleEditText(hint),
            getAlphaTextFormFieldNormalForm(
                validator: (validator != null)
                    ? validator
                    : (text) {
                        if (text!.isEmpty) return "";
                      },
                hint: hint,
                textEditingController: controller,
                onTap: () {
                  getDatePicker();
                })
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }

  getHeaderSection({required String text}) {
    return Container(
        color: AlphaColors.backFormSection,
        width: getScreenWidth(context),
        height: 50,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
        child: Row(children: [
          getYellowVerticalLine(),
          SizedBox(width: 18),
          getAlphaTextTitle1White(text)
        ]));
  }

  getYellowVerticalLine() {
    return Container(
      width: 2,
      color: AlphaColors.Yellow,
      padding: EdgeInsets.only(left: 8, right: 8),
    );
  }

  setInitialValue() {
    swimmerNameTC.text = model.firstName;
    swimmerFamilyTC.text = model.lastName;
    swimmerBDTC.text = model.birthDate;
    swimmerNationalCodeTC.text = model.code;
    swimmerPhoneTC.text = model.phone;
    swimmerTelTC.text = model.homePhone;
    swimmerAddressTC.text = model.homeAddress;
    schoolPhoneTC.text = model.schoolPhone;
    schoolRegionTC.text = model.schoolRegion;
    schoolAddressTC.text = model.schoolAddress;
    fatherEducationTC.text = model.fatherEducation;
    fatherJobTC.text = model.fatherJob;
    fatherPhoneTC.text = model.fatherPhone;
    motherEducationTC.text = model.motherEducation;
    motherJobTC.text = model.motherJob;
    motherPhoneTC.text = model.motherPhone;
    introducerTC.text = model.reagent;
    familiarityTC.text = getFamiliarString(model.familiarity);
    useService = getServiceValue(model.useService);
  }

  bool getServiceValue(String value) {
    if (value == 'true') {
      return true;
    }
    return false;
  }

  Swimmer createSwimmerFromForm() {
    var newSwimmer = Swimmer(
        sid: model.swimmer.sid,
        code: swimmerNationalCodeTC.text,
        phone: swimmerPhoneTC.text,
        firstName: swimmerNameTC.text,
        lastName: swimmerFamilyTC.text,
        birthDate: swimmerBDTC.text,
        homeAddress: swimmerAddressTC.text,
        homePhone: swimmerTelTC.text,
        schoolAddress: schoolAddressTC.text,
        schoolPhone: schoolPhoneTC.text,
        schoolRegion: schoolRegionTC.text,
        fatherEducation: fatherEducationTC.text,
        fatherJob: fatherJobTC.text,
        fatherPhone: fatherPhoneTC.text,
        motherEducation: motherEducationTC.text,
        motherJob: motherJobTC.text,
        motherPhone: motherPhoneTC.text,
        useService: useService.toString(),
        reagent: introducerTC.text,
        image: model.swimmer.image,
        nationalImage: model.swimmer.nationalImage,
        shenasImage: model.swimmer.shenasImage,
        insuranceImage: model.swimmer.insuranceImage,
        eshtegalImage: model.swimmer.eshtegalImage,
        familiarity: familiarityTC.text);
    newSwimmer.familiarityType = getFamiliarityType(familiarityTC.text);
    return newSwimmer;
  }

  String getFamiliarityType(String value) {
    if (value == getAppLocalization(context).socialMedia) {
      return '1';
    } else if (value == getAppLocalization(context).swimmers) {
      return '2';
    } else if (value == getAppLocalization(context).visitor) {
      return '3';
    } else if (value == getAppLocalization(context).coach) {
      return '4';
    } else if (value == getAppLocalization(context).other) {
      return '5';
    }
    return '0';
  }

  String getFamiliarString(String type) {
    if (type == '1') {
      return getAppLocalization(context).socialMedia;
    } else if (type == '2') {
      return getAppLocalization(context).swimmers;
    } else if (type == '3') {
      return getAppLocalization(context).visitor;
    } else if (type == '4') {
      return getAppLocalization(context).coach;
    } else if (type == '5') {
      return getAppLocalization(context).other;
    }
    return '';
  }

  TextEditingController swimmerNameTC = TextEditingController();
  TextEditingController swimmerFamilyTC = TextEditingController();
  TextEditingController swimmerBDTC = TextEditingController();
  TextEditingController swimmerNationalCodeTC = TextEditingController();
  TextEditingController swimmerPhoneTC = TextEditingController();
  TextEditingController swimmerTelTC = TextEditingController();
  TextEditingController swimmerAddressTC = TextEditingController();
  TextEditingController schoolPhoneTC = TextEditingController();
  TextEditingController schoolRegionTC = TextEditingController();
  TextEditingController schoolAddressTC = TextEditingController();
  TextEditingController fatherEducationTC = TextEditingController();
  TextEditingController fatherJobTC = TextEditingController();
  TextEditingController fatherPhoneTC = TextEditingController();
  TextEditingController motherEducationTC = TextEditingController();
  TextEditingController motherJobTC = TextEditingController();
  TextEditingController motherPhoneTC = TextEditingController();
  TextEditingController introducerTC = TextEditingController();
  TextEditingController jobTC = TextEditingController();
  TextEditingController familiarityTC = TextEditingController();

  // XFile? profileImage;
  // XFile? melliImage;
  // XFile? idImage;
  // XFile? insuranceImage;
  // XFile? educationImage;

  getProfileImage() {
    return model.getProfileImage();
  }

  getMelliImage() {
    return model.getMelliImage();
  }

  getIDImage() {
    return model.getIDImage();
  }

  getInsuranceImage() {
    return model.getInsuranceImage();
  }

  getEducationImage() {
    return model.getEducationImage();
  }

  selectProfileImage() async {
    try {
      var pickedFile = await getImage();
      model.setImageProfile(pickedFile: pickedFile);
      setState(() {});
    } catch (e) {
      print("exception for ${e.toString()}");
    }
  }

  deleteProfileImage() {
    setState(() {
      model.deleteImageProfile();
    });
  }

  selectMelliImage() async {
    try {
      var pickedFile = await getImage();
      model.setImageMelli(pickedFile: pickedFile);
      setState(() {});
    } catch (e) {
      print("exception for ${e.toString()}");
    }
  }

  deleteMelliImage() {
    setState(() {
      model.deleteImageMelli();
    });
  }

  selectIdImage() async {
    try {
      var pickedFile = await getImage();
      model.setImageId(pickedFile: pickedFile);
      setState(() {});
    } catch (e) {
      print("exception for ${e.toString()}");
    }
  }

  deleteIdImage() {
    setState(() {
      model.deleteImageId();
    });
  }

  selectEducationImage() async {
    try {
      var pickedFile = await getImage();
      model.setImageEducation(pickedFile: pickedFile);
      setState(() {});
    } catch (e) {
      print("exception for ${e.toString()}");
    }
  }

  deleteEducationImage() {
    setState(() {
      model.deleteImageEducation();
    });
  }

  selectInsuranceImage() async {
    try {
      var pickedFile = await getImage();
      model.setImageInsurance(pickedFile: pickedFile);
      setState(() {});
    } catch (e) {
      print("exception for ${e.toString()}");
    }
  }

  deleteInsuranceImage() {
    setState(() {
      model.deleteImageInsurance();
    });
  }
// selectMelliImage() async {
//   try {
//     var pickedFile = await getImage();
//     if (widget.swimmer != null) {
//       widget.swimmer!.nationalImage = '';
//     }
//     setState(() {
//       widget.swimmer!.melliImageFile = pickedFile;
//       print("setState called for ${widget.swimmer!.melliImageFile!.path}");
//     });
//   } catch (e) {
//     print("exception for ${e.toString()}");
//   }
// }
//
// deleteMelliImage() {
//   setState(() {
//     widget.swimmer!.melliImageFile = null;
//     if (widget.swimmer != null) {
//       widget.swimmer!.nationalImage = '';
//     }
//     melliSource = AlphaImageSource.Asset;
//   });
// }
//
// selectIDImage() async {
//   try {
//     var pickedFile = await getImage();
//     if (widget.swimmer != null) {
//       widget.swimmer!.shenasImage = '';
//     }
//     setState(() {
//       widget.swimmer!.idImageFile = pickedFile;
//       print("setState called for ${widget.swimmer!.idImageFile!.path}");
//     });
//   } catch (e) {
//     print("exception for ${e.toString()}");
//   }
// }
//
// deleteIDImage() {
//   setState(() {
//     widget.swimmer!.idImageFile = null;
//     if (widget.swimmer != null) {
//       widget.swimmer!.shenasImage = '';
//     }
//     idSource = AlphaImageSource.Asset;
//   });
// }
//
// selectEducationImage() async {
//   try {
//     var pickedFile = await getImage();
//     if (widget.swimmer != null) {
//       widget.swimmer!.eshtegalImage = '';
//     }
//     setState(() {
//       widget.swimmer!.educationImageFile = pickedFile;
//       print(
//           "setState called for ${widget.swimmer!.educationImageFile!.path}");
//     });
//   } catch (e) {
//     print("exception for ${e.toString()}");
//   }
// }
//
// deleteEducationImage() {
//   setState(() {
//     widget.swimmer!.educationImageFile = null;
//     if (widget.swimmer != null) {
//       widget.swimmer!.eshtegalImage = '';
//     }
//     educationSource = AlphaImageSource.Asset;
//   });
// }
//
// selectInsuranceImage() async {
//   try {
//     var pickedFile = await getImage();
//     if (widget.swimmer != null) {
//       widget.swimmer!.insuranceImage = '';
//     }
//     setState(() {
//       widget.swimmer!.insuranceImageFile = pickedFile;
//       print(
//           "setState called for ${widget.swimmer!.insuranceImageFile!.path}");
//     });
//   } catch (e) {
//     print("exception for ${e.toString()}");
//   }
// }
//
// deleteInsuranceImage() {
//   setState(() {
//     widget.swimmer!.insuranceImageFile = null;
//     if (widget.swimmer != null) {
//       widget.swimmer!.insuranceImage = '';
//     }
//     insuranceSource = AlphaImageSource.Asset;
//   });
// }
}
