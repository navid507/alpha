import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_swimmer.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

getAlphaClubHeader({required BuildContext context, Function()? onPressed}) {
  return Container(
      padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
      child: Row(
        children: [
          getMenuIcon(imageAsset: 'assets/images/ic_alpha_logo.png'),
          getAlphaTextTitle1White(AppLocalizations.of(context)!.alphaClub),
          Spacer(),
          GestureDetector(
              onTap: onPressed,
              child:
                  getAlphaTextMoreYellow(AppLocalizations.of(context)!.more)),
        ],
      ));
}

getAlphaSwimmers(
    {required BuildContext context, required AlphaClub alphaClub}) {
  var size = (alphaClub.alphaSwimmers.swimmers.length < 4)
      ? alphaClub.alphaSwimmers.swimmers.length
      : 3;
  return alphaClub.alphaSwimmers.swimmers
      .getRange(0, size)
      .map<Widget>((s) => getAlphaElement(swimmer: s, context: context))
      .toList();
}

getAlphaElement(
    {required BuildContext context, required AlphaSwimmer swimmer}) {
  var height = 140.0;
  var width = 100.0;
  return Container(
      height: height,
      width: width,
      child: Stack(
        children: [
          getAlphaClubSwimmer(),
          Column(
            children: [
              getAvatarImageAlphaClub(swimmer.image),
              Padding(
                  padding: EdgeInsets.all(4.0),
                  child: getAlphaTextSwimmer(swimmer.fullName)),
              getAlphaTextMoreYellow(
                  AppLocalizations.of(context)!.numberOfAttendant +
                      " ${swimmer.sessions}")
            ],
          )
        ],
        alignment: Alignment.topCenter,
      ));
  // return getAlphaClubSwimmer(child: child);
}

getAlphaClubSwimmer(
    {double height = 140.0, double width = 120.0, double topPadding = 0}) {
  return Positioned(
    child: Opacity(
        opacity: 0.1,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: AlphaColors.backTopSwimmers,
              borderRadius: BorderRadius.circular(5.0)),
        )),
    top: topPadding,
  );
}
