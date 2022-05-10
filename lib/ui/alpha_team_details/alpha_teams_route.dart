import 'package:alpha/back/public_repo/models/alpha_teams/team_info.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/generated/l10n.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/alpha_teams/alpha_team_details_model.dart';
import 'package:alpha/ui/alpha_teams/alpha_team_details_route.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'alpha_teams_model.dart';

class AlphaTeamsRoute extends StatefulWidget {
  const AlphaTeamsRoute({Key? key}) : super(key: key);

  @override
  _AlphaTeamsRouteState createState() => _AlphaTeamsRouteState();
}

class _AlphaTeamsRouteState extends State<AlphaTeamsRoute> {
  late AlphaHeader alphaHeader;

  AppLocalizations get appLocalization => getAppLocalization(context);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAlphaTeams();
    });
    super.initState();
  }

  AlphaTeamsModel get model =>
      Provider.of<AlphaTeamsModel>(context, listen: false);

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
      child: AlphaDrawerWidget(page: AlphaRoutes.Teams),
    );
  }

  getScreenBody(BuildContext screenBodyContext) {
    return Stack(children: [
      alphaHeader.getImageOfHeader(),
      Column(children: [
        alphaHeader.getTopMenu(screenBodyContext),
        getTitle(),
        Expanded(child: getMainSectionView())
      ])
    ]);
  }

  getTitle() {
    return getAlphaPageTitleWhite(appLocalization.allTeams);
  }

  getMainSectionView() {
    return Selector<AlphaTeamsModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.alphaTeamsState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return getLoadingView();
              }
            case LoadingState.Loaded:
              {
                // return getLoadingView();
                return getAlphaTeamsListView();
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
  }

  getTeamInfo(TeamInfo teamInfo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: AlphaColors.backDrawer, borderRadius: BorderRadius.circular(8)),
        height: 100,
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
                  getAlphaTextHeaderWhite(teamInfo.name),
                  getAlphaTextTeamScoreBig(AppLocalizations.of(context)!.score +
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
            ])
          ],
        ),
      ),
    );
  }

  getTeamImages(
      {required String lead,
      required String swimmer2,
      required String swimmer3}) {
    return Container(
        width: 120,
        height: 75,
        child: Stack(
          children: [
            getAvatarImageNextInTeamSwimmerMain(swimmer3),
            Positioned(
                child: getAvatarImageNextInTeamSwimmerMain(swimmer2), right: 17),
            Positioned(
              child: getAvatarImageFirstInTeamSwimmerMain(lead),
              right: 34,
            ),
          ],
          alignment: Alignment.centerRight,
        ));
  }

  getAlphaTeamsListView() {
    List<Widget> all = model.alphaTeams!.alphaTeams.map<Widget>((alphaTeam) {
      return getTeamInfo(alphaTeam);
    }).toList();

    return ListView(
      scrollDirection: Axis.vertical,
      children: all,
    );
  }

  getLoadingView() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: Colors.red,
        strokeWidth: 2.0,
      ),
      height: 20,
      width: 40,
    );
  }

  getRetryButton() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: getAlphaDialogButtonOk(
            text: getAppLocalization(context).retry,
            onPressed: () {
              model.getAlphaTeams();
            }));
  }

  // showTeamDetailsRoute(TeamInfo teamInfo) {
  //   Future.delayed(
  //       Duration.zero,
  //       () => Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => ChangeNotifierProvider<TopSwimmersModel>(
  //                   create: (context) => TopSwimmersModel(),
  //                   child: TopSwimmersRoute()))));
  // }


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
}
