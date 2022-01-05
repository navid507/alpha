import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'get_image.dart';

getHeader(BuildContext context) {
  return Stack(children: [getImageOfHeader()]);
}

getTopMenu(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(
        left: 12, right: 12, top: AlphaSizes.getTopPadding(constValue: 8)),
    child: Row(
      children: [
        getMenuIcon(
            imageAsset: 'assets/images/ic_menu.png',
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }),
        Spacer(),
        getLogoImage(),
        Spacer(),
        getEmptyIcon()
      ],
    ),
  );
}

getImageOfHeader() {
  return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 0.3,
      child: Opacity(
          opacity: 0.4,
          child: Image(
              image: AssetImage('assets/images/header_swimmer.jpg'),
              fit: BoxFit.fitWidth,
              alignment: Alignment.center)));
}

getDrawer(BuildContext context) {
  return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            getHeaderOfDrawer(),
            ListTile(
              tileColor: AlphaColors.Yellow,
              focusColor: AlphaColors.Gold,
              title: const Text('fasf'),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ));
}

getHeaderOfDrawer() {
  return Selector<FirstPageModel, String>(
      selector: (_, model) => model.activeSwimmer?.image ?? "",
      builder: (context, swimmerImage, child) {
        // var l = 'my name';
        return DrawerHeader(
            decoration: BoxDecoration(color: AlphaColors.background),
            child: Text(swimmerImage));
      });
}
