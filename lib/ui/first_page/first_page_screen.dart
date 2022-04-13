import 'package:alpha/back/accounting/accounting_repo.dart';
import 'package:alpha/back/public_repo/models/alpha_club/alpha_club.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/alpha_teams.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/team_info.dart';
import 'package:alpha/back/public_repo/models/gallery/gallery.dart';
import 'package:alpha/back/public_repo/models/gallery/image_item.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmers.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/alpha_club/alpha_club_model.dart';
import 'package:alpha/ui/alpha_club/alpha_club_route.dart';
import 'package:alpha/ui/alpha_team_details/alpha_teams_model.dart';
import 'package:alpha/ui/alpha_team_details/alpha_teams_route.dart';
import 'package:alpha/ui/alpha_teams/alpha_team_details_model.dart';
import 'package:alpha/ui/alpha_teams/alpha_team_details_route.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/first_page/first_page_model.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_club.dart';
import 'package:alpha/ui/first_page/widgets/get_alpha_teams.dart';
import 'package:alpha/ui/gallery/gallery_model.dart';
import 'package:alpha/ui/gallery/gallery_route.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          getInTeamCompetitionsHeader(
              context: context,
              onPressed: () {
                showAlphaTeamsRoute();
              }),
          getAlphaTeamRow(),
          getAlphaClubHeader(context: context, onPressed: () {}),
          getAlphaClubRow(),
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
    return Selector<FirstPageModel, LoadingState>(
        selector: (_, model) => model.topSwimmersState,
        builder: (galleyContext, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return Text(AppLocalizations.of(context)!.loading);
              }
            case LoadingState.Loaded:
              {
                var topSwimmers = model.alphaTopSwimmers!;
                return Container(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        getTopSwimmers(
                            context: context,
                            swimmer: topSwimmers.topSwimmers[1],
                            rank: 1),
                        getTopSwimmers(
                            context: context,
                            swimmer: topSwimmers.topSwimmers[0],
                            rank: 0),
                        getTopSwimmers(
                            context: context,
                            swimmer: topSwimmers.topSwimmers[2],
                            rank: 2),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ));
              }
            case LoadingState.LoadError:
              return getRetryButtonTopSwimmer();
          }
        });
  }

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

  showAlphaTeamsRoute() {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<AlphaTeamsModel>(
                    create: (context) => AlphaTeamsModel(),
                    child: AlphaTeamsRoute()))));
  }

  showTeamDetailsRoute(TeamInfo teamInfo) {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChangeNotifierProvider<AlphaTeamDetailsModel>(
                        create: (context) =>
                            AlphaTeamDetailsModel(teamInfo: teamInfo),
                        child: AlphaTeamDetailsRoute()))));
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
              child: Column(
                children: [
                  Row(
                    children: getAlphaSwimmers(
                        alphaClub: alphaClub, context: context),
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  ),
                  getAlphaClubButton(context)
                ],
              ),
              height: 210,
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
    return GestureDetector(
      onTap: () {
        showTeamDetailsRoute(teamInfo);
      },
      child: Container(
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
                  getAlphaTextTitle2White(teamInfo.name),
                  getAlphaTextTeamScore(AppLocalizations.of(context)!.score +
                      ": " +
                      teamInfo.score.toString())
                ],
              ),
              Spacer(),
              getMenuIcon(
                  imageAsset: "assets/images/ic_more.png",
                  onPressed: () {
                    showTeamDetailsRoute(teamInfo);
                  })
            ]),
            Container(
              height: 1,
              color: AlphaColors.TextGray,
              width: getScreenWidth(context),
            )
          ],
        ),
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

  getRetryButtonTopSwimmer() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: getAlphaDialogButtonOk(
            text: getAppLocalization(context).retry,
            onPressed: () {
              model.getTopSwimmers();
            }));
  }

  getRetryButtonAlphaClub() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: getAlphaDialogButtonOk(
            text: getAppLocalization(context).retry,
            onPressed: () {
              model.getTopSwimmers();
            }));
  }

  getSlider(AlphaImageGallery alphaImageGallery, double width) {
    return GestureDetector(
      onTap: () {
        showGallery();
      },
      child: CarouselSlider(
          items: alphaImageGallery.images.map((alphaImageItem) {
            return Builder(builder: (BuildContext cContext) {
              return getImageSlide(alphaImageItem, width);
            });
          }).toList(),
          options: CarouselOptions(height: 200.0, enlargeCenterPage: true)),
    );
  }

  getImageSlide(AlphaImageItem alphaImageItem, double width) {
    return Stack(children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            child: getImageForSlider(
                image:
                    /*'assets/images/splash_screen.png' */ alphaImageItem.image,
                width: width,
                height: 200),
            decoration:
                BoxDecoration(gradient: AlphaColors.ImageGalleyGradient),
          )),
      // Image.network(alphaImageItem.image),
      Align(
        child: Container(
          child: getAlphaTextTitle1White(alphaImageItem.title),
          padding: const EdgeInsets.all(8),
        ),
        alignment: Alignment.bottomRight,
      )
      // Text(alphaImageItem.content)
    ]);
  }

  getImageForSlider(
      {required String image, required double width, required double height}) {
    return Stack(
      children: [
        getFitImageFromNetwork(
            image: image, width: width, height: height, fit: BoxFit.fill),
        Opacity(
            opacity: 0.5,
            child: Container(
              height: height,
              width: width,
              decoration:
                  BoxDecoration(gradient: AlphaColors.ImageGalleyGradient),
            ))
      ],
    );
  }

  showGallery() {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<GalleryModel>(
                    create: (context) => GalleryModel(),
                    child: GalleryRoute()))));
  }

  getInTeamCompetitionsHeader(
      {required BuildContext context, Function()? onPressed}) {
    return Container(
        padding: const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
        child: Row(
          children: [
            getMenuIcon(imageAsset: 'assets/images/ic_team.png'),
            getAlphaTextTitle1White(
                AppLocalizations.of(context)!.inTeamChallenges),
            Spacer(),
            GestureDetector(
                onTap: onPressed,
                child: getAlphaTextMoreYellow(
                    AppLocalizations.of(context)!.allTeams)),
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
}
