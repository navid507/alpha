import 'package:alpha/back/accounting/models/swimmer.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_swimmer.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_club.dart';
import 'package:alpha/ui/first_page/widgets/get_in_team_competetions.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_slider.dart';
import 'package:alpha/ui/my_widgets/get_header.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'widgets/get_top_swimmers.dart';

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  BuildContext? apContext;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<FirstPageModel>(apContext!, listen: false).getGallery();
      Provider.of<FirstPageModel>(apContext!, listen: false).getTopSwimmers();
      Provider.of<FirstPageModel>(apContext!, listen: false).getAlphaClub();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return ChangeNotifierProvider<FirstPageModel>(
        create: (context) => FirstPageModel(),
        child: Scaffold(
            drawer: getDrawer(context),
            body: Builder(builder: (context) => getScreenBody(context))));
  }

  getScreenBody(BuildContext screenBodyContext) {
    apContext = screenBodyContext;

    return Stack(children: [
      getImageOfHeader(),
      ListView(
        scrollDirection: Axis.vertical,
        children: [
          getTopMenu(screenBodyContext),
          getGallerySlider(),
          getTopSwimmersHeader(
              context: context,
              onPressed: () {
                showTopSwimmersRoute();
              }),
          getTopSwimmersRow(),
          getInTeamCompetitionsHeader(context: context, onPressed: () {}),
          getTeamCompetitionRow(),
          getAlphaClubHeader(context: context, onPressed: () {}),
          getAlphaClubRow()
        ],
      ),
    ]);
  }

  getGallerySlider() {
    return Selector<FirstPageModel, AlphaImageGallery?>(
        selector: (_, model) => model.alphaImageGallery,
        builder: (galleyContext, gallery, child) {
          if (gallery == null) {
            return getSlider(
                AlphaImageGallery(images: [
                  AlphaImageItem(
                      id: 'id',
                      title: '... در حال بارگذاری',
                      content: 'content',
                      link: 'link',
                      image: 'assets/images/splash_screen.png')
                ]),
                getScreenWidth(context));
          } else {
            return getSlider(gallery, getScreenWidth(context));
          }
        });
  }

  // getTopSwimmersSection()
  // {
  //   return Column(children: [],);
  // }

  getTopSwimmersRow() {
    return Selector<FirstPageModel, TopSwimmers?>(
        selector: (_, model) => model.alphaTopSwimmers,
        builder: (galleyContext, topSwimmers, child) {
          if (topSwimmers == null) {
            return Text(AppLocalizations.of(context)!.loading);
          } else {
            return Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Row(
                  children: [
                    getTopSwimmers(
                        swimmer: topSwimmers.topSwimmers[2], rank: 1),
                    getTopSwimmers(
                        swimmer: topSwimmers.topSwimmers[0], rank: 0),
                    getTopSwimmers(swimmer: topSwimmers.topSwimmers[1], rank: 2)
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ));
          }
        });
  }

  getTeamCompetitionRow() {
    return Selector<FirstPageModel, TopSwimmers?>(
        selector: (_, model) => model.alphaTopSwimmers,
        builder: (galleyContext, topSwimmers, child) {
          if (topSwimmers == null) {
            return Text(AppLocalizations.of(context)!.loading);
          } else {
            return Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: getTeamImages(
                    lead: topSwimmers.topSwimmers[0].image,
                    swimmer2: topSwimmers.topSwimmers[1].image,
                    swimmer3: topSwimmers.topSwimmers[2].image));
          }
        });
  }

  showTopSwimmersRoute() {}

  showInTeamCompetitionRoute() {}

  showAlphaClubRoute() {}

  getAlphaClubRow() {
    return Selector<FirstPageModel, AlphaClub?>(
        selector: (_, model) => model.alphaClub,
        builder: (galleyContext, alphaClub, child) {
          if (alphaClub == null) {
            return Text(AppLocalizations.of(context)!.loading);
          } else {
            return Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                children: getAlphaSwimmers(alphaClub),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              height: 140,
            );
          }
        });
  }

  getAlphaSwimmers(AlphaClub alphaClub) {
    var size = (alphaClub.alphaSwimmers.swimmers.length < 4)
        ? alphaClub.alphaSwimmers.swimmers.length
        : 3;
    return alphaClub.alphaSwimmers.swimmers
        .getRange(0, size)
        .map<Widget>((s) => getAlphaElement(s))
        .toList();
  }

  getAlphaElement(AlphaSwimmer swimmer) {
    var height = 140.0;
    var width = 120.0;
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
                    child: getAlphaTextTitle2White(swimmer.fullName)),
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
}
