import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

getInTeamCompetitionsHeader({required BuildContext context, Function()? onPressed}) {
  return Container(
      padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
      child: Row(
        children: [
          getMenuIcon(imageAsset: 'assets/images/ic_team.png'),
          getAlphaTextTitle1White(AppLocalizations.of(context)!.inTeamChallenges),
          Spacer(),
          GestureDetector(
              onTap: onPressed,
              child:
              getAlphaTextMoreYellow(AppLocalizations.of(context)!.more)),
        ],
      ));
}


getTeamImages(
    {required String lead,
      required String swimmer2,
      required String swimmer3}) {
  return Container(
      width: 95,
      height: 45,
      child: Stack(
        children: [
          getAvatarImageNextInTeamSwimmer(swimmer3),
          Positioned(
              child: getAvatarImageNextInTeamSwimmer(swimmer2), right: 17),
          Positioned(
            child: getAvatarImageFirstInTeamSwimmer(lead),
            right: 34,
          ),
        ],
        alignment: Alignment.centerRight,
      ));
}
