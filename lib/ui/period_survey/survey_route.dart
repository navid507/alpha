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

import '../../back/global_constants.dart';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';



class SurveyRoute extends StatefulWidget {
  final String periodID;
  final String userID;
  final String surveyURL = "$mainUrl/index.php/universal/survey";

  SurveyRoute({Key? key, required this.periodID, required this.userID}) : super(key: key);

  @override
  _SurveyRouteState createState() => _SurveyRouteState();
}

class _SurveyRouteState extends State<SurveyRoute> {
  late AlphaHeader alphaHeader;
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
   // if (Platform.isAndroid) WebView.platform = AndroidWebView();

    final url = "${widget.surveyURL}/${widget.periodID}/${widget.userID}";
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(url));
  }

  AppLocalizations get appLocalization => getAppLocalization(context);

  @override
  Widget build(BuildContext context) {
    alphaHeader = AlphaHeader(drawerContext: context);
    return Scaffold(
      body: Builder(
        builder: (drawerContext) {
          return getScreenBody(drawerContext);
        },
      ),
    );
  }

  Widget getScreenBody(BuildContext screenBodyContext) {
    return Stack(
      children: [
        alphaHeader.getImageOfHeader(),
        Column(
          children: [
            alphaHeader.getTopMenu(screenBodyContext),
            getTitle(),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 44),
                    child: getContent(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: getAlphaPageTitleWhite(appLocalization.survey),
    );
  }

  Widget getContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          color: AlphaColors.background,
          borderRadius: BorderRadius.circular(12),
        ),
        width: double.infinity,
        padding: const EdgeInsets.only(top: 72),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(child: getSurveyForm()),
              getSanabadView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget getSurveyForm() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: WebViewWidget(controller: _controller),
    );
  }

  Widget getSanabadView() {
    return GestureDetector(
      onTap: () {
        launchUrl(Uri.parse(appLocalization.site_info));
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
            border: Border.all(color: AlphaColors.White.withAlpha(90), width: 0.7),
          ),
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

  Widget getSplitterLine() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 1,
        color: AlphaColors.White.withAlpha(100),
      ),
    );
  }

  void callTo(String tel) {
    launchUrl(Uri.parse("tel:$tel"));
  }

  void showTelegram(String address) {
    launchUrl(Uri.parse(address));
  }

  Widget getVerticalLine() {
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

