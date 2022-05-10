import 'package:flutter/material.dart';

import 'alpha_text.dart';
import 'constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations getAppLocalization(BuildContext context) =>
    AppLocalizations.of(context)!;

getHeader(BuildContext context) {
  final Size size = MediaQuery.of(context).size;

  return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: Container(
        width: size.width,
        height: AlphaSizes.TopHeader,
        child: Stack(
          children: [],
        ),
      ));
}

getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

getAlphaButton(
    {required double width,
    required double height,
    required String text,
    GestureTapCallback? onPressed}) {
  return Padding(
      padding: EdgeInsets.all(12.0),
      child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: AlphaColors.Yellow,
          ),
          child: InkWell(
              onTap: onPressed,
              highlightColor: AlphaColors.Silver,
              child: Container(
                child: getAlphaTextHeaderBlack(text),
                alignment: Alignment.center,
              ))));
}

getAlphaDialogButtonOk(
    {required String text, required VoidCallback onPressed}) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AlphaColors.Yellow)),
      onPressed: onPressed,
      child: getAlphaTextTitle1Dark(text));
}

getAlphaDialogButtonCancel(
    {required String text, required VoidCallback onPressed}) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(AlphaColors.cancelButtonDialog)),
      onPressed: onPressed,
      child: getAlphaTextTitle1White(text));
}

getAlphaThemeData() {
  return ThemeData(
      pageTransitionsTheme: PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
      }),
      scaffoldBackgroundColor: AlphaColors.background,
      secondaryHeaderColor: AlphaColors.Yellow,
      primaryColor: AlphaColors.Yellow);
}

// bool isValidPhone(String phone) {
//   // phone = '09155101452';
//   String phonePattern = r"/^(?:[+0]9)?[0-9]{10}$";
//   RegExp regex = RegExp(phonePattern);
//   var a = regex.hasMatch(phone);
//   return a;
// }

bool isPhoneValid(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{9}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return false; //'Please enter mobile number';
  } else if (!regExp.hasMatch(value)) {
    return false; //'Please enter valid mobile number';
  }
  return true;
}

bool isTelValid(String value) {
  String pattern = r'(^(?:[0])?[0-9]{10}$)';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool isEmailValid(String email) {
  String emailPattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(emailPattern);
  return regex.hasMatch(email);
}

bool isPasswordValid(String password) => password.length >= 6;

bool isCodeValid(String code) => code.length == 4;

bool isNameValid(String code) => code.length > 2;

bool isNationalCodeValid(String code) => code.length == 10;
