import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

class AlphaText extends StatelessWidget {
  final FontWeight weight;
  final Alignment alignment;
  final String text;
  final double fontSize;
  final FontStyle fontStyle;
  Color fontColor;

  AlphaText(
      {Key? key,
      this.fontSize = 14,
      this.weight = FontWeight.normal,
      this.alignment = Alignment.center,
      this.fontStyle = FontStyle.normal,
      this.fontColor = Colors.white,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('$text',
        style: TextStyle(
            fontFamily: 'AlphaFonts',
            fontStyle: fontStyle,
            fontWeight: weight,
            color: fontColor,
            fontSize: fontSize));
  }

  factory AlphaText.title1(
          {Key? myKey,
          required String myText,
          Alignment alignment = Alignment.center}) =>
      AlphaText(
          key: myKey,
          fontSize: 14,
          weight: FontWeight.normal,
          alignment: alignment,
          fontStyle: FontStyle.normal,
          text: myText);

  factory AlphaText.title2(
          {Key? myKey,
          required String myText,
          Alignment alignment = Alignment.center}) =>
      AlphaText(
          key: myKey,
          fontSize: 13,
          weight: FontWeight.normal,
          alignment: alignment,
          fontStyle: FontStyle.normal,
          text: myText);

  factory AlphaText.body(
          {Key? myKey,
          required String myText,
          Alignment alignment = Alignment.center}) =>
      AlphaText(
          key: myKey,
          fontSize: 12,
          weight: FontWeight.normal,
          alignment: alignment,
          fontStyle: FontStyle.normal,
          text: myText);

  factory AlphaText.more(
          {Key? myKey,
          required String myText,
          Alignment alignment = Alignment.center}) =>
      AlphaText(
          key: myKey,
          fontSize: 10,
          weight: FontWeight.normal,
          alignment: alignment,
          fontStyle: FontStyle.normal,
          text: myText);

  factory AlphaText.rank(
          {Key? myKey,
          required String myText,
          Alignment alignment = Alignment.center}) =>
      AlphaText(
          key: myKey,
          fontSize: 8,
          weight: FontWeight.bold,
          alignment: alignment,
          fontStyle: FontStyle.normal,
          text: myText);

  factory AlphaText.header(
          {Key? myKey,
          required String myText,
          Alignment alignment = Alignment.center}) =>
      AlphaText(
          key: myKey,
          fontSize: 14,
          weight: FontWeight.bold,
          alignment: alignment,
          fontStyle: FontStyle.normal,
          text: myText);
}

class AlphaTextBuilder {
  late AlphaText _alphaText;

  // var fittedBox = true;

  AlphaTextBuilder({required String myText}) {
    _alphaText = AlphaText(text: myText);
  }

  AlphaTextBuilder getTitle1() {
    _alphaText = AlphaText.title1(myText: _alphaText.text);
    return this;
  }

  AlphaTextBuilder getTitle2() {
    _alphaText = AlphaText.title2(myText: _alphaText.text);
    return this;
  }

  AlphaTextBuilder getMore() {
    _alphaText = AlphaText.more(myText: _alphaText.text);
    return this;
  }

  AlphaTextBuilder getRank() {
    _alphaText = AlphaText.rank(myText: _alphaText.text);
    return this;
  }

  AlphaTextBuilder getBody() {
    _alphaText = AlphaText.body(myText: _alphaText.text);
    return this;
  }

  AlphaTextBuilder getHeader() {
    _alphaText = AlphaText.header(myText: _alphaText.text);
    return this;
  }

  AlphaTextBuilder setWhiteColor() {
    // fontColor = color;
    _alphaText.fontColor = AlphaColors.White;
    return this;
  }

  AlphaTextBuilder setYellowColor() {
    // fontColor = color;
    _alphaText.fontColor = AlphaColors.Yellow;
    return this;
  }

  AlphaTextBuilder setGrayColor() {
    // fontColor = color;
    _alphaText.fontColor = AlphaColors.TextGray;
    return this;
  }

  Widget build({Key? key}) {
    return FittedBox(
        child: AlphaText(
            key: key,
            fontSize: _alphaText.fontSize,
            weight: _alphaText.weight,
            alignment: _alphaText.alignment,
            fontStyle: _alphaText.fontStyle,
            fontColor: _alphaText.fontColor,
            text: _alphaText.text));
  }
}

getAlphaTextTitle1White(String text) {
  return AlphaTextBuilder(myText: text).getTitle1().setWhiteColor().build();
}

getAlphaTextTitle2White(String text) {
  return AlphaTextBuilder(myText: text).getTitle2().setWhiteColor().build();
}

getAlphaTextBodyWhite(String text) {
  return AlphaTextBuilder(myText: text).getBody().setWhiteColor().build();
}

getAlphaTextMoreYellow(String text) {
  return AlphaTextBuilder(myText: text).getMore().setYellowColor().build();
}

getAlphaTextRank(String text) {
  return AlphaTextBuilder(myText: text).getRank().setGrayColor().build();
}
