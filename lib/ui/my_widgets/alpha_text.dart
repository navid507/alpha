import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

// class AlphaText extends StatelessWidget {
//   final FontWeight weight;
//   Alignment alignment;
//   final String text;
//   final double fontSize;
//   final FontStyle fontStyle;
//   Color fontColor;
//
//   AlphaText(
//       {Key? key,
//       this.fontSize = 14,
//       this.weight = FontWeight.normal,
//       this.alignment = Alignment.center,
//       this.fontStyle = FontStyle.normal,
//       this.fontColor = Colors.white,
//       required this.text})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(text,
//         style: TextStyle(
//             fontFamily: 'AlphaFonts',
//             fontStyle: fontStyle,
//             fontWeight: weight,
//             color: fontColor,
//             fontSize: fontSize));
//   }
//
//   factory AlphaText.title1(
//           {Key? myKey,
//           required String myText,
//           Alignment alignment = Alignment.center}) =>
//       AlphaText(
//           key: myKey,
//           fontSize: 14,
//           weight: FontWeight.normal,
//           alignment: alignment,
//           fontStyle: FontStyle.normal,
//           text: myText);
//
//   factory AlphaText.title2(
//           {Key? myKey,
//           required String myText,
//           Alignment alignment = Alignment.center}) =>
//       AlphaText(
//           key: myKey,
//           fontSize: 13,
//           weight: FontWeight.normal,
//           alignment: alignment,
//           fontStyle: FontStyle.normal,
//           text: myText);
//
//   factory AlphaText.body(
//           {Key? myKey,
//           required String myText,
//           Alignment alignment = Alignment.center}) =>
//       AlphaText(
//           key: myKey,
//           fontSize: 12,
//           weight: FontWeight.normal,
//           alignment: alignment,
//           fontStyle: FontStyle.normal,
//           text: myText);
//
//   factory AlphaText.more(
//           {Key? myKey,
//           required String myText,
//           Alignment alignment = Alignment.center}) =>
//       AlphaText(
//           key: myKey,
//           fontSize: 10,
//           weight: FontWeight.normal,
//           alignment: alignment,
//           fontStyle: FontStyle.normal,
//           text: myText);
//
//   factory AlphaText.rank(
//           {Key? myKey,
//           required String myText,
//           Alignment alignment = Alignment.center}) =>
//       AlphaText(
//           key: myKey,
//           fontSize: 8,
//           weight: FontWeight.bold,
//           alignment: alignment,
//           fontStyle: FontStyle.normal,
//           text: myText);
//
//   factory AlphaText.header(
//           {Key? myKey,
//           required String myText,
//           Alignment alignment = Alignment.center}) =>
//       AlphaText(
//           key: myKey,
//           fontSize: 16,
//           weight: FontWeight.bold,
//           alignment: alignment,
//           fontStyle: FontStyle.normal,
//           text: myText);
//
//   factory AlphaText.score(
//           {Key? myKey,
//           required String myText,
//           Alignment alignment = Alignment.center}) =>
//       AlphaText(
//           key: myKey,
//           fontSize: 24,
//           weight: FontWeight.bold,
//           alignment: alignment,
//           fontStyle: FontStyle.normal,
//           text: myText);
// }

class AlphaTextBuilder {
  var isFitted = false;
  FontWeight weight = FontWeight.normal;
  Alignment alignment = Alignment.center;
  final String text;
  double fontSize = 12.0;
  FontStyle fontStyle = FontStyle.normal;
  Color fontColor = AlphaColors.White;
  int? maxLines;
  TextOverflow? textOverflow;

  AlphaTextBuilder(this.text);

  AlphaTextBuilder getTitle1() {
    this.fontSize = 14.0;
    return this;
  }

  AlphaTextBuilder getTitle2() {
    this.fontSize = 13.0;
    return this;
  }

  AlphaTextBuilder getMore() {
    this.fontSize = 10.0;
    return this;
  }

  AlphaTextBuilder getRank() {
    this.fontSize = 8.0;
    return this;
  }

  AlphaTextBuilder getBody() {
    this.fontSize = 12.0;
    return this;
  }

  AlphaTextBuilder getHeader() {
    this.fontSize = 18.0;
    return this;
  }

  AlphaTextBuilder getScore() {
    this.fontSize = 20.0;
    this.weight = FontWeight.bold;
    return this;
  }

  AlphaTextBuilder setSize(double fontSize) {
    this.fontSize = fontSize;
    return this;
  }

  AlphaTextBuilder setFontWeight(FontWeight fontWeight) {
    this.weight = fontWeight;
    return this;
  }

  AlphaTextBuilder setFontStyle(FontStyle fontStyle) {
    this.fontStyle = fontStyle;
    return this;
  }

  AlphaTextBuilder setWhiteColor() {
    fontColor = AlphaColors.White;
    return this;
  }

  AlphaTextBuilder setRedColor() {
    fontColor = AlphaColors.Red;
    return this;
  }

  AlphaTextBuilder setYellowColor() {
    fontColor = AlphaColors.Yellow;
    return this;
  }

  AlphaTextBuilder setGreenColor() {
    fontColor = AlphaColors.Green;
    return this;
  }

  AlphaTextBuilder setGrayColor() {
    fontColor = AlphaColors.TextGray;
    return this;
  }

  AlphaTextBuilder setGrayLightColor() {
    fontColor = AlphaColors.TextGrayLight;
    return this;
  }

  AlphaTextBuilder setFit() {
    isFitted = true;
    return this;
  }

  AlphaTextBuilder setBlackColor() {
    fontColor = AlphaColors.TextDark;
    return this;
  }

  AlphaTextBuilder setAlignment(Alignment alignment) {
    this.alignment = alignment;
    return this;
  }

  AlphaTextBuilder setMaxLines(int maxLine) {
    this.maxLines = maxLine;
    return this;
  }

  AlphaTextBuilder setTextOverflow(TextOverflow textOverflow) {
    this.textOverflow = textOverflow;
    return this;
  }

  Widget build({Key? key}) {
    return (isFitted)
        ? FittedBox(fit: BoxFit.scaleDown, child: getText())
        : getText();
  }

  getText() {
    return Text(text,
        overflow: textOverflow,
        textAlign: TextAlign.justify,
        style: TextStyle(
            fontFamily: 'AlphaFonts',
            fontStyle: fontStyle,
            fontWeight: weight,
            color: fontColor,
            fontSize: fontSize));
  }
}

getAlphaPageTitleWhite(String text) {
  return AlphaTextBuilder(text).getHeader().setWhiteColor().build();
}

getAlphaTextTitle1White(String text) {
  return AlphaTextBuilder(text).getTitle1().setWhiteColor().build();
}

getAlphaTextTitle1Dark(String text) {
  return AlphaTextBuilder(text).getTitle1().setBlackColor().build();
}

getAlphaTextTitle2White(String text) {
  return AlphaTextBuilder(text).getTitle2().setWhiteColor().build();
}

getAlphaTextBodyWhite(String text) {
  return AlphaTextBuilder(text).getBody().setWhiteColor().build();
}

getAlphaTextBodyYellow(String text) {
  return AlphaTextBuilder(text).getBody().setYellowColor().build();
}

getAlphaTextBodyGray(String text) {
  return AlphaTextBuilder(text).getBody().setGrayColor().build();
}

getAlphaTextMoreYellow(String text) {
  return AlphaTextBuilder(text).getMore().setYellowColor().build();
}

getAlphaTextMoreWhite(String text) {
  return AlphaTextBuilder(text).getMore().setWhiteColor().build();
}

getAlphaTextMoreGrayLight(String text) {
  return AlphaTextBuilder(text).getMore().setGrayLightColor().build();
}

getAlphaTextRank(String text) {
  return AlphaTextBuilder(text).getRank().setGrayColor().build();
}

getAlphaTextTeamScore(String text) {
  return AlphaTextBuilder(text)
      .getRank()
      .setYellowColor()
      .setAlignment(Alignment.centerRight)
      .build();
}

getAlphaTextTeamScoreBig(String text) {
  return AlphaTextBuilder(text)
      .getBody()
      .setYellowColor()
      .setAlignment(Alignment.centerRight)
      .build();
}
getAlphaTextTitle1Black(String text) {
  return AlphaTextBuilder(text)
      .getMore()
      .setBlackColor()
      .setAlignment(Alignment.center)
      .build();
}

getAlphaTextSwimmer(String text) {
  return AlphaTextBuilder(text).getTitle2().setWhiteColor().setFit().build();
}

getBetaTextSwimmer(String text) {
  return AlphaTextBuilder(text).getBody().setWhiteColor().setFit().build();
}

getOmegaTextSwimmer(String text) {
  return AlphaTextBuilder(text).getMore().setWhiteColor().setFit().build();
}

getAlphaTextHeaderBlack(String text) {
  return AlphaTextBuilder(text)
      .getHeader()
      .setBlackColor()
      .setAlignment(Alignment.center)
      .build();
}

getAlphaTextTitleEditText(String text) {
  return AlphaTextBuilder(text)
      .getMore()
      .setAlignment(Alignment.centerRight)
      .setWhiteColor()
      .build();
}

getAlphaTextErrorEditText(String text) {
  return AlphaTextBuilder(text)
      .getMore()
      .setAlignment(Alignment.centerRight)
      .setRedColor()
      .build();
}

getAlphaSecondaryTitle(String text) {
  return AlphaTextBuilder(text).getMore().setGrayLightColor().build();
}

getAlphaSecondaryValue(String text) {
  return AlphaTextBuilder(text).getBody().setWhiteColor().build();
}

getAlphaTextHeaderWhite(String text) {
  return AlphaTextBuilder(text).getHeader().setWhiteColor().build();
}

getAlphaTextHeaderYellow(String text) {
  return AlphaTextBuilder(text).getHeader().setYellowColor().build();
}

getAlphaTextTitle1Yellow(String text) {
  return AlphaTextBuilder(text).getTitle1().setYellowColor().build();
}

getAlphaTextTitle1WhiteFit(String text) {
  return AlphaTextBuilder(text).setFit().getTitle1().setWhiteColor().build();
}

getAlphaTextSessionScore(String text) {
  return AlphaTextBuilder(text).getScore().setWhiteColor().build();
}

getAlphaTextRecordTime(String text) {
  return AlphaTextBuilder(text).getScore().setYellowColor().build();
}

getAlphaTextBodyGrayLight(String text) {
  return AlphaTextBuilder(text).getBody().setGrayLightColor().build();
}

getAlphaTextSessionDescription(String text) {
  return AlphaTextBuilder(text)
      .getMore()
      .setWhiteColor()
      .setMaxLines(2)
      .build();
}

getAlphaTextRuleNumber(String text) {
  return AlphaTextBuilder(text)
      .setSize(16)
      .setFontWeight(FontWeight.bold)
      .setYellowColor()
      .build();
}

getAlphaAboutDescription(String text) {
  return AlphaTextBuilder(text).getBody().setWhiteColor().build();
}

getAlphaTextBodyWhiteGallery(String text) {
  return AlphaTextBuilder(text).getBody().setWhiteColor().setFit().build();
}

getAlphaTextAcceptBody(String text) {
  return AlphaTextBuilder(text).getBody().setGreenColor().build();
}

getAlphaTextSessionNumber(String text) {
  return AlphaTextBuilder(text)
      .setSize(60)
      .setFontWeight(FontWeight.normal)
      .setYellowColor()
      .build();
}
getAlphaTextSessionNumberLabel(String text) {
  return AlphaTextBuilder(text)
      .setSize(10)
      .setFontWeight(FontWeight.bold)
      .setWhiteColor()
      .build();
}
// getAlphaTextTitleWhait(String text) {
//   return AlphaTextBuilder(myText: text).getTitle1().setRedColor().build();
// }
