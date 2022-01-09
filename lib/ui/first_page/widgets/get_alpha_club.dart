import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
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