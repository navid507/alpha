import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

class AlphaText extends StatelessWidget {
  final FontWeight weight;
  Alignment alignment;
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
    return Text(text,
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
          fontSize: 16,
          weight: FontWeight.bold,
          alignment: alignment,
          fontStyle: FontStyle.normal,
          text: myText);
}

class AlphaTextBuilder {
  late AlphaText _alphaText;
  var isFitted = false;

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

  AlphaTextBuilder setRedColor() {
    // fontColor = color;
    _alphaText.fontColor = AlphaColors.Red;
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

  AlphaTextBuilder setGrayLightColor() {
    // fontColor = color;
    _alphaText.fontColor = AlphaColors.TextGrayLight;
    return this;
  }

  AlphaTextBuilder setFit() {
    // fontColor = color;
    isFitted = true;
    return this;
  }

  AlphaTextBuilder setBlackColor() {
    // fontColor = color;
    _alphaText.fontColor = AlphaColors.TextDark;
    return this;
  }

  AlphaTextBuilder setAlignment(Alignment alignment) {
    // fontColor = color;
    _alphaText.alignment = alignment;
    return this;
  }

  Widget build({Key? key}) {
    return (isFitted)
        ? FittedBox(
            child: AlphaText(
                key: key,
                fontSize: _alphaText.fontSize,
                weight: _alphaText.weight,
                alignment: _alphaText.alignment,
                fontStyle: _alphaText.fontStyle,
                fontColor: _alphaText.fontColor,
                text: _alphaText.text))
        : AlphaText(
            key: key,
            fontSize: _alphaText.fontSize,
            weight: _alphaText.weight,
            alignment: _alphaText.alignment,
            fontStyle: _alphaText.fontStyle,
            fontColor: _alphaText.fontColor,
            text: _alphaText.text);
  }
}

getAlphaPageTitleWhite(String text) {
  return AlphaTextBuilder(myText: text).getHeader().setWhiteColor().build();
}

getAlphaTextTitle1White(String text) {
  return AlphaTextBuilder(myText: text).getTitle1().setWhiteColor().build();
}

getAlphaTextTitle1Dark(String text) {
  return AlphaTextBuilder(myText: text).getTitle1().setBlackColor().build();
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

getAlphaTextMoreWhite(String text) {
  return AlphaTextBuilder(myText: text).getMore().setWhiteColor().build();
}

getAlphaTextRank(String text) {
  return AlphaTextBuilder(myText: text).getRank().setGrayColor().build();
}

getAlphaTextTeamScore(String text) {
  return AlphaTextBuilder(myText: text)
      .getRank()
      .setGrayColor()
      .setAlignment(Alignment.centerRight)
      .build();
}

getAlphaTextTitle1Black(String text) {
  return AlphaTextBuilder(myText: text)
      .getMore()
      .setBlackColor()
      .setAlignment(Alignment.center)
      .build();
}

getAlphaTextSwimmer(String text) {
  return AlphaTextBuilder(myText: text)
      .getTitle2()
      .setWhiteColor()
      .setFit()
      .build();
}

getBetaTextSwimmer(String text) {
  return AlphaTextBuilder(myText: text)
      .getBody()
      .setWhiteColor()
      .setFit()
      .build();
}

getOmegaTextSwimmer(String text) {
  return AlphaTextBuilder(myText: text)
      .getMore()
      .setWhiteColor()
      .setFit()
      .build();
}

getAlphaTextHeaderBlack(String text) {
  return AlphaTextBuilder(myText: text)
      .getHeader()
      .setBlackColor()
      .setAlignment(Alignment.center)
      .build();
}

getAlphaTextTitleEditText(String text) {
  return AlphaTextBuilder(myText: text)
      .getMore()
      .setAlignment(Alignment.centerRight)
      .setWhiteColor()
      .build();
}

getAlphaTextErrorEditText(String text) {
  return AlphaTextBuilder(myText: text)
      .getMore()
      .setAlignment(Alignment.centerRight)
      .setRedColor()
      .build();
}

getAlphaSecondaryTitle(String text) {
  return AlphaTextBuilder(myText: text).getMore().setGrayLightColor().build();
}

getAlphaSecondaryValue(String text) {
  return AlphaTextBuilder(myText: text).getBody().setWhiteColor().build();
}

getAlphaTextHeaderWhite(String text) {
  return AlphaTextBuilder(myText: text).getHeader().setWhiteColor().build();
}

getAlphaTextTitle1Yellow(String text) {
  return AlphaTextBuilder(myText: text).getHeader().setYellowColor().build();
}
