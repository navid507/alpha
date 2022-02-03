import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/team_info.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/ui/alpha_club/alpha_club_model.dart';
import 'package:alpha/ui/alpha_club/alpha_club_route.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_club.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_teams.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_slider.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_route.dart';
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
  late AlphaHeader alphaHeader;

  FirstPageModel get model =>
      Provider.of<FirstPageModel>(context, listen: false);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getGallery();
      model.getTopSwimmers();
      model.getAlphaTeams();
      model.getAlphaClub();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    alphaHeader = AlphaHeader(drawerContext: buildContext, needBack: false);

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
      child: AlphaDrawerWidget(page: AlphaRoutes.Home),
    );
  }

  getScreenBody(BuildContext screenBodyContext) {
    apContext = screenBodyContext;

    return Stack(children: [
      alphaHeader.getImageOfHeader(),
      Column(children: [
        alphaHeader.getTopMenu(screenBodyContext),
        Expanded(
            child: ListView(scrollDirection: Axis.vertical, children: [
          getGallerySlider(),
          getTopSwimmersHeader(
              context: context,
              onPressed: () {
                showTopSwimmersRoute();
              }),
          getTopSwimmersRow(),
          getInTeamCompetitionsHeader(context: context, onPressed: () {}),
          getAlphaTeamRow(),
          getAlphaClubHeader(context: context, onPressed: () {}),
          getAlphaClubRow(),
          getAlphaClubButton(context)
        ]))
      ]),
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

  // getTeamCompetitionRow() {
  //   return Selector<FirstPageModel, TopSwimmers?>(
  //       selector: (_, model) => model.alphaTopSwimmers,
  //       builder: (galleyContext, topSwimmers, child) {
  //         if (topSwimmers == null) {
  //           return Text(AppLocalizations.of(context)!.loading);
  //         } else {
  //           return Container(
  //               padding: const EdgeInsets.only(left: 8.0, right: 8.0),
  //               child: getTeamImages(
  //                   lead: topSwimmers.topSwimmers[0].image,
  //                   swimmer2: topSwimmers.topSwimmers[1].image,
  //                   swimmer3: topSwimmers.topSwimmers[2].image));
  //         }
  //       });
  // }

  showTopSwimmersRoute() {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<TopSwimmersModel>(
                    create: (context) => TopSwimmersModel(),
                    child: TopSwimmersRoute()))));
  }

  showInTeamCompetitionRoute() {}

  showAlphaClubRoute() {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<AlphaClubModel>(
                    create: (context) => AlphaClubModel(),
                    child: AlphaClubRoute()))));
  }

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
                children:
                    getAlphaSwimmers(alphaClub: alphaClub, context: context),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
              height: 140,
            );
          }
        });
  }

  getAlphaTeamRow() {
    return Selector<FirstPageModel, AlphaTeams?>(
        selector: (_, model) => model.alphaTeams,
        builder: (galleyContext, alphaTeams, child) {
          if (alphaTeams == null) {
            return Text(AppLocalizations.of(context)!.loading);
          } else {
            return Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child:
                  getAlphaTeams(alphaTeams: alphaTeams, buildContext: context),
              height: 180,
            );
          }
        });
  }

  getAlphaTeams(
      {required AlphaTeams alphaTeams, required BuildContext buildContext}) {
    var size =
        (alphaTeams.alphaTeams.length > 3) ? 3 : alphaTeams.alphaTeams.length;
    return Column(
      children: alphaTeams
          .getRankedTeams()
          .getRange(0, size)
          .map<Widget>((t) => getTeamInfo(t))
          .toList(),
    );
  }

  getTeamInfo(TeamInfo teamInfo) {
    return Container(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            getTeamImages(
                lead: teamInfo.members![0].image,
                swimmer2: teamInfo.members![1].image,
                swimmer3: teamInfo.members![2].image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getAlphaTextBodyWhite(teamInfo.name),
                getAlphaTextTeamScore(AppLocalizations.of(context)!.score +
                    ": " +
                    teamInfo.score.toString())
              ],
            ),
            Spacer(),
            getMenuIcon(imageAsset: "assets/images/ic_more.png")
          ]),
          Container(
            height: 1,
            color: AlphaColors.TextGray,
            width: getScreenWidth(context),
          )
        ],
      ),
    );
  }

  getAlphaClubButton(BuildContext context) {
    return getAlphaButton(
        width: getScreenWidth(context),
        height: 45.0,
        text: AppLocalizations.of(context)!.alphaClubView,
        onPressed: () {
          showAlphaClubRoute();
        });
  }
}
