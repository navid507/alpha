import 'dart:io';

import 'package:flutter/material.dart';
import 'package:alpha/ui/my_widgets/alpha_text_field.dart';

import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:alpha/ui/drawer/get_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../back/global_constants.dart';

class SurveyRoute extends StatefulWidget {
  String periodID;
  String userID;
  var surveyURL = "$mainUrl/index.php/universal/survey";

  SurveyRoute({Key? key, required this.periodID, required this.userID})
      : super(key: key);

  @override
  _SurveyRouteState createState() => _SurveyRouteState();
}

class _SurveyRouteState extends State<SurveyRoute> {
  @override
  initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  late AlphaHeader alphaHeader;

  AppLocalizations get appLocalization => getAppLocalization(context);

  @override
  Widget build(BuildContext context) {
    alphaHeader = AlphaHeader(drawerContext: context);
    return Scaffold(body: Builder(builder: (drawerContext) {
      return getScreenBody(drawerContext);
    }));
  }

  getScreenBody(BuildContext screenBodyContext) {
    return Stack(children: [
      alphaHeader.getImageOfHeader(),
      Column(children: [
        alphaHeader.getTopMenu(screenBodyContext),
        getTitle(),
        Expanded(
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.only(top: 44), child: getContent()),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 0),
                child: Container(
                  child: Row(
                    children: [
                      Spacer(),
                      Image.asset(
                        "assets/images/ic_menu_periods_unselected.png",
                        width: 96,
                        height: 96,
                      ),
                    ],
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
            ],
          ),
        )
      ]),
    ]);
  }

  getTitle() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: getAlphaPageTitleWhite(getAppLocalization(context).survey));
  }

  getContent() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
              color: AlphaColors.background,
              borderRadius: BorderRadius.circular(12)),
          width: getScreenWidth(context),
          padding: EdgeInsets.only(top: 72),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [Expanded(child: getSurveyForm()), getSanabadView()],
            ),
          ),
        ));
  }

  getSurveyForm() {
    var url = "${widget.surveyURL}/${widget.periodID}/${widget.userID}";
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: WebView(
        initialUrl: Uri.encodeFull(url),
        javascriptMode: JavascriptMode.unrestricted,
        onWebResourceError: (err) {
          print(err);
        },
      ),
    );
  }

  getSanabadView() {
    return GestureDetector(
      onTap: () {
        launch(appLocalization.site_info);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 4),
        child: Container(
          alignment: Alignment.center,
          height: 24,
          width: double.infinity,
          decoration: BoxDecoration(
              color: AlphaColors.backDialog,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: AlphaColors.White.withAlpha(90), width: 0.7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              getAlphaTextMoreGrayLight(appLocalization.developer),
              getSplitterLine(),
              getAlphaTextMoreGrayLight(appLocalization.sai),
            ],
          ),
        ),
      ),
    );
  }

  getRow({
    required String title,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
        onTap: onTap,
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                Image.asset(
                  image,
                  width: 48,
                ),
                getAlphaTextTitle1White(title)
              ],
            )));
  }

  getSplitterLine() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 1,
        color: AlphaColors.White.withAlpha(100),
      ),
    );
  }

  getHorizontalLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Container(
        height: 0.5,
        width: getScreenWidth(context),
        color: AlphaColors.White.withAlpha(30),
      ),
    );
  }

  callTo(String tel) {
    launch("tel:$tel");
  }

  showTelegram(String address) {
    launch(address);
  }

  getVerticalLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        color: AlphaColors.White.withAlpha(100),
        width: 1,
        height: 25,
      ),
    );
  }
}
