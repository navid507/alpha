import 'package:alpha/ui/my_widgets/alpha_text_field.dart';
import 'package:flutter/material.dart';

import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsRoute extends StatefulWidget {
  ContactUsRoute({Key? key}) : super(key: key);

  @override
  _ContactUsRouteState createState() => _ContactUsRouteState();
}

class _ContactUsRouteState extends State<ContactUsRoute> {
  late AlphaHeader alphaHeader;

  AppLocalizations get appLocalization => getAppLocalization(context);
  TextEditingController messageTC = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    alphaHeader = AlphaHeader(drawerContext: context);
    return Scaffold(
        drawer: getDrawerWithProvider(),
        body: Builder(builder: (drawerContext) {
          return getScreenBody(drawerContext);
        }));
  }

  getDrawerWithProvider() {
    return ChangeNotifierProvider<DrawerModel>(
      create: (_) {
        return DrawerModel();
      },
      child: AlphaDrawerWidget(page: AlphaRoutes.ContactUs),
    );
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
                      Padding(
                        padding: const EdgeInsets.only(top: 52.0),
                        child: Image.asset(
                          "assets/images/3x/alpha_top_logo.png",
                          height: 50,
                        ),
                      ),
                      Spacer(),
                      Image.asset(
                        "assets/images/im_contact_us.png",
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
        child: getAlphaPageTitleWhite(getAppLocalization(context).contactUs));
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
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      getRow(
                          title: appLocalization.email,
                          image: "assets/images/ic_mail_contact_us.png",
                          onTap: () {
                            launch(
                                "mailto:${appLocalization.email}?subject=&body=");
                          }),
                      getHorizontalLine(),
                      getRow(
                          title: appLocalization.telegram,
                          image: "assets/images/ic_telegram.png",
                          onTap: () {
                            launch(appLocalization.telegramLink);
                          }),
                      getHorizontalLine(),
                      getRow(
                          title: appLocalization.instagram,
                          image: "assets/images/ic_instagram.png",
                          onTap: () {
                            launch(appLocalization.instagramLink);
                          }),
                      getForm()
                    ],
                  ),
                ),
                getSanabadView()
              ],
            ),
          ),
        ));
  }

  getSanabadView() {
    return GestureDetector(
      onTap: () {
        launch(appLocalization.site_info);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
        child: Container(
          alignment: Alignment.center,
          height: 30,
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
              getAlphaTextBodyGrayLight(appLocalization.developer),
              getSplitterLine(),
              getAlphaTextBodyGrayLight(appLocalization.sai),
            ],
          ),
        ),
      ),
    );
  }

  doSendMessage() {
    if (_formKey.currentState!.validate()) {}
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  getForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                child: getAlphaTextTitle1White(appLocalization.sendMessage),
                alignment: Alignment.centerRight,
              ),
              getAlphaTextFormFieldComment(
                  validator: (value) {
                    if (value != null) {
                      if (isNameValid(value)) {
                        return null;
                      } else {
                        return appLocalization.pleaseFillTheField;
                      }
                    }
                    return appLocalization.pleaseFillTheField;
                  },
                  hint: appLocalization.message,
                  textEditingController: messageTC),
              Container(
                  width: getScreenWidth(context),
                  child: getAlphaDialogButtonOk(
                      text: appLocalization.sendMessage,
                      onPressed: () {
                        doSendMessage();
                      }))
            ],
          )),
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
