import 'package:alpha/back/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsRoute extends StatefulWidget {
  AboutUsRoute({Key? key}) : super(key: key);

  @override
  _AboutUsRouteState createState() => _AboutUsRouteState();
}

class _AboutUsRouteState extends State<AboutUsRoute> {
  late AlphaHeader alphaHeader;
  var armanImageURL = "$mainUrl/assets/img/arman_ahmadi.jpg";
  var pooyanImageURL = "$mainUrl/assets/img/pouyan_ahmadi.jpg";
  var abiPoolImageURL = "$mainUrl/assets/img/abi_hasht_pool.jpg";
  var homaPoolImageURL = "$mainUrl/assets/img/hotel_homa_pool.jpg";

  AppLocalizations get appLocalization => getAppLocalization(context);

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
      child: AlphaDrawerWidget(page: AlphaRoutes.AboutUs),
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
              Padding(padding: EdgeInsets.only(top: 44), child: getPage()),
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
                        "assets/images/im_about_us.png",
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
        child: getAlphaPageTitleWhite(getAppLocalization(context).aboutUs));
  }

  getPage() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
              color: AlphaColors.backDialog,
              borderRadius: BorderRadius.circular(12)),
          width: getScreenWidth(context),
          padding: EdgeInsets.only(top: 16),
          child: getListOfRules(),
        ));
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
        height: 1,
        width: getScreenWidth(context),
        color: AlphaColors.White.withAlpha(50),
      ),
    );
  }

  getListOfRules() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: ListView(
        children: [
          getAlphaTextHeaderWhite(appLocalization.technicalTeam),
          Row(
            children: [
              getCoach(
                  image: pooyanImageURL,
                  name: appLocalization.pooyanAhmadi,
                  telegram: getAppLocalization(context).telegramPooyanAhmadi,
                  tel: getAppLocalization(context).telPooyanAhmadi),
              getCoach(
                  image: armanImageURL,
                  name: appLocalization.armanAhmadi,
                  telegram: getAppLocalization(context).telegramArmanAhmadi,
                  tel: getAppLocalization(context).telArmanAhmadi)
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: getAlphaAboutDescription(appLocalization.aboutUsDescription),
          ),
          Padding(padding: EdgeInsets.only(top: 8), child: getHorizontalLine()),
          getAlphaTextHeaderWhite(appLocalization.pools),
          Container(
            height: 130,
            width: getScreenWidth(context),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                getPoolView(
                    image: abiPoolImageURL,
                    name: appLocalization.abiPool,
                    lat: 36.351224,
                    lng: 59.526107),
                getPoolView(
                    image: homaPoolImageURL,
                    name: appLocalization.homaPool,
                    lat: 36.319915,
                    lng: 59.563508)
              ],
            ),
          )
        ],
      ),
    );
  }

  getPoolView({
    required String image,
    required String name,
    required double lat,
    required double lng,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          showMap(lat, lng);
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AlphaColors.backCoach),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      image,
                      height: 72,
                      width: 120,
                    )),
              ),
              getAlphaTextBodyWhite(name),
            ],
          ),
        ),
      ),
    );
  }

  getCoach(
      {required String image,
      required String name,
      required String telegram,
      required String tel}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AlphaColors.backCoach),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(image)),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: getAlphaTextBodyWhite(name)),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                      child: Icon(
                        Icons.phone,
                        size: 20,
                        color: AlphaColors.White.withAlpha(100),
                      ),
                      onTap: () {
                        callTo(tel);
                      },
                    )),
                    getVerticalLine(),
                    Expanded(
                        child: GestureDetector(
                      child: Icon(
                        Icons.connected_tv,
                        size: 20,
                        color: AlphaColors.White.withAlpha(100),
                      ),
                      onTap: () {
                        showTelegram(telegram);
                      },
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showMap(double lat, double lng) {
    launch("http://maps.google.com/maps?z=12&t=m&q=loc:$lat+-$lng");
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
