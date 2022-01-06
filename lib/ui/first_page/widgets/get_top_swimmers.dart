import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

getTopSwimmersHeader({required BuildContext context, Function()? onPressed}) {
  return Container(
      padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
      child: Row(
        children: [
          getMenuIcon(imageAsset: 'assets/images/ic_swimmer.png'),
          getAlphaTextTitle1White(AppLocalizations.of(context)!.topSwimmers),
          Spacer(),
          GestureDetector(
              onTap: onPressed,
              child:
                  getAlphaTextMoreYellow(AppLocalizations.of(context)!.more)),
        ],
      ));
}

getTopSwimmers({required TopSwimmer swimmer, required int rank}) {
  var containerWidth = 100.0;
  var containerHeight = 170.0;
  var avatarTopPadding = 50.0;
  var rankString = (rank + 1).toString();
  var rankColor = AlphaColors.Yellow;
  late var avatar; // = getAvatarImageFirstTopSwimmer(swimmer.image);

  switch (rank) {
    case 0:
      containerWidth = 120.0;
      containerHeight = 170.0;
      avatarTopPadding = 50.0;
      avatar = getAvatarImageFirstTopSwimmer(swimmer.image);
      rankColor = AlphaColors.Yellow;
      break;
    case 1:
      containerWidth = 100.0;
      containerHeight = 130.0;
      avatarTopPadding = 40.0;
      avatar = getAvatarImageSecondTopSwimmer(swimmer.image);
      rankColor = AlphaColors.Silver;
      break;
    default:
      containerWidth = 100.0;
      containerHeight = 130.0;
      avatarTopPadding = 40.0;
      avatar = getAvatarImageThirdTopSwimmer(swimmer.image);
      rankColor = AlphaColors.Bronze;

      break;
  }

  return Container(
    child: Stack(
      children: [
        getBackTopSwimmer(topPadding: avatarTopPadding),
        Column(
          children: [
            Stack(
              children: [
                avatar!,
                getRankCircle(rank: rankString, color: rankColor)
              ],
              alignment: Alignment.bottomCenter,
            ),
            getAlphaTextBodyWhite(swimmer.name),
            getAlphaTextMoreYellow(swimmer.score)
          ],
        )
      ],
      alignment: Alignment.topCenter,
    ),
    height: containerHeight,
    width: containerWidth,
  );
}

getRankCircle({required String rank, required Color color}) {
  return Container(
    alignment: Alignment.center,
    width: 16.0,
    height: 16.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0),
      color: color,
    ),
    child: getAlphaTextRank(rank),
  );
}

getBackTopSwimmer({double size = 100.0, double topPadding = 0}) {
  return Positioned(
    child: Opacity(
        opacity: 0.1,
        child: Container(
          height: size,
          width: size + 15,
          decoration: BoxDecoration(
              color: AlphaColors.backTopSwimmers,
              borderRadius: BorderRadius.circular(5.0)),
        )),
    top: topPadding,
  );
}
