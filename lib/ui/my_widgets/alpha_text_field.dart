import 'dart:ui';

import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

class AlphaTextFieldBuilder {
  var text = '';
  var hint = '';
  var errorText = '';
  GestureTapCallback? onTap;
  var color = AlphaColors.White;
  var hintColor = AlphaColors.BackDark;
  var alignment = Alignment.centerRight;
  var textAlignment = TextAlign.start;
  var inputType = TextInputType.text;
  TextEditingController? textEditingController;
  FormFieldValidator<String>? validator; // = (value) => null;

  // var fittedBox = true;

  AlphaTextFieldBuilder({required this.hint, this.text = ''});

  AlphaTextFieldBuilder setOnTap(GestureTapCallback? onTap) {
    this.onTap = onTap;
    return this;
  }

  AlphaTextFieldBuilder setWhiteColor() {
    this.color = AlphaColors.White;
    return this;
  }

  AlphaTextFieldBuilder setYellowColor() {
    this.color = AlphaColors.Yellow;
    return this;
  }

  AlphaTextFieldBuilder setValidator(FormFieldValidator<String>? validator) {
    this.validator = validator;
    return this;
  }

  AlphaTextFieldBuilder setGrayColor() {
    this.color = AlphaColors.TextGray;
    return this;
  }

  // AlphaTextFieldBuilder setFit() {
  //   // fontColor = color;
  //   isFitted = true;
  //   return this;
  // }

  AlphaTextFieldBuilder setBlackColor() {
    // fontColor = color;
    this.color = AlphaColors.TextDark;
    return this;
  }

  AlphaTextFieldBuilder setHintColor(Color color) {
    // fontColor = color;
    this.hintColor = color;
    return this;
  }

  AlphaTextFieldBuilder setAlignment(Alignment alignment) {
    // fontColor = color;
    this.alignment = alignment;
    return this;
  }

  AlphaTextFieldBuilder setErrorText(String errorText) {
    // fontColor = color;
    this.errorText = errorText;
    return this;
  }

  AlphaTextFieldBuilder setTextAlignment(TextAlign textAlign) {
    // fontColor = color;
    this.textAlignment = textAlign;
    return this;
  }

  AlphaTextFieldBuilder setTextEditingController(
      TextEditingController textEditingController) {
    // fontColor = color;
    this.textEditingController = textEditingController;
    return this;
  }

  AlphaTextFieldBuilder setInputType(TextInputType inputType) {
    // fontColor = color;
    this.inputType = inputType;
    return this;
  }

  Widget build({Key? key}) {
    return Padding(
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: SizedBox(
            child: TextFormField(
                onTap: onTap,
                validator: validator,
                controller: textEditingController,
                keyboardType: inputType,
                decoration: InputDecoration(
                    isCollapsed: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: AlphaColors.Yellow, width: 1.0)),
                    hintText: hint,
                    errorText: (errorText.isNotEmpty) ? errorText : null,
                    fillColor: Colors.brown,
                    // errorBorder: OutlineInputBorder(
                    //     borderRadius: BorderRadius.circular(4.0),
                    //     borderSide:
                    //     BorderSide(color: AlphaColors.Red, width: 0.75)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide:
                            BorderSide(color: AlphaColors.Yellow, width: 1.0)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            color: AlphaColors.TextGray, width: 0.75)),
                    hintStyle: TextStyle(
                        color: hintColor,
                        fontFamily: 'AlphaFonts',
                        fontStyle: FontStyle.normal,
                        fontSize: 12),
                    errorStyle: TextStyle(
                        fontFamily: 'AlphaFonts',
                        fontStyle: FontStyle.normal,
                        fontSize: 10)),
                cursorColor: AlphaColors.White,
                //Cursor color change
                textAlign: textAlignment,
                textInputAction: TextInputAction.done,
                style: TextStyle(
                    height: 1,
                    color: color,
                    fontFamily: 'AlphaFonts',
                    fontStyle: FontStyle.normal,
                    decorationColor: AlphaColors.Silver,
                    fontSize: 14.0,
                    //Font color change
                    backgroundColor: AlphaColors
                        .Transparent //TextFormField title background color change
                    ))));
  }
}

// getAlphaTextFormFieldNormal({required String hint, String text = ''}) {
//   return AlphaTextFieldBuilder(hint: hint, text: text)
//       .setWhiteColor()
//       .setAlignment(Alignment.center)
//       .build();
// }

getAlphaTextFormFieldNormal(
    {required String hint,
    String error = '',
    FormFieldValidator<String>? validator,
    required TextEditingController textEditingController}) {
  return AlphaTextFieldBuilder(hint: hint)
      .setWhiteColor()
      .setTextAlignment(TextAlign.start)
      .setAlignment(Alignment.center)
      .setErrorText(error)
      .setValidator(validator)
      .setTextEditingController(textEditingController)
      .setInputType(TextInputType.phone)
      .build();
}

getAlphaTextFormFieldNumber(
    {required String hint,
    String text = '',
    String error = '',
    FormFieldValidator<String>? validator,
    required TextEditingController textEditingController}) {
  return AlphaTextFieldBuilder(hint: hint, text: text)
      .setWhiteColor()
      .setTextAlignment(TextAlign.end)
      .setAlignment(Alignment.center)
      .setErrorText(error)
      .setValidator(validator)
      .setTextEditingController(textEditingController)
      .setInputType(TextInputType.phone)
      .build();
}

getAlphaTextFormFieldNormalForm(
    {required String hint,
    String error = '',
    FormFieldValidator<String>? validator,
    GestureTapCallback? onTap,
    required TextEditingController textEditingController}) {
  return AlphaTextFieldBuilder(hint: hint)
      .setWhiteColor()
      .setTextAlignment(TextAlign.start)
      .setAlignment(Alignment.center)
      .setErrorText(error)
      .setValidator(validator)
      .setHintColor(AlphaColors.backTopSwimmers)
      .setTextEditingController(textEditingController)
      .setInputType(TextInputType.phone)
      .setOnTap(onTap)
      .build();
}
