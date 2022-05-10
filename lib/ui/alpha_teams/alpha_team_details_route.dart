import 'package:alpha/back/public_repo/models/alpha_teams/team_info.dart';
import 'package:alpha/back/public_repo/models/alpha_teams/team_member.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/generated/l10n.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/get_image.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/public_profile/public_profile_model.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../public_profile/public_profile_route.dart';
import 'alpha_team_details_model.dart';

class AlphaTeamDetailsRoute extends StatefulWidget {
  const AlphaTeamDetailsRoute({Key? key}) : super(key: key);

  @override
  _AlphaTeamDetailsRouteState createState() => _AlphaTeamDetailsRouteState();
}

class _AlphaTeamDetailsRouteState extends State<AlphaTeamDetailsRoute> {
  late AlphaHeader alphaHeader;

  AppLocalizations get appLocalization => getAppLocalization(context);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAlphaTeams();
    });
    super.initState();
  }

  AlphaTeamDetailsModel get model =>
      Provider.of<AlphaTeamDetailsModel>(context, listen: false);

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
    return getAlphaPageTitleWhite(model.teamInfo.name);
  }

  getMainSectionView() {
    return Selector<AlphaTeamDetailsModel, LoadingState>(
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


  getTeamSwimmerView(TeamMember swimmer) {
    return GestureDetector(onTap: (){
      showPublicProfile(swimmer.id);
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: AlphaColors.backDialog,
                borderRadius: BorderRadius.circular(12)),
            width: getScreenWidth(context),
            height: 140,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  getAvatarImageAlphaClub(swimmer.image),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            getAlphaTextTitle1White(swimmer.name),
                            getAlphaTextMoreYellow(
                                " ${getAppLocalization(context).score}: ${swimmer.score}"),
                            Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0, right: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              // getAlphaSecondaryTitle(
                                                  // getAppLocalization(context)
                                                  //     .practiseSessionNumber),
                                              // getAlphaSecondaryValue(swimmer.present),
                                              // getAlphaSecondaryTitle(
                                                  // getAppLocalization(context)
                                                  //     .absentsSessionNumber),
                                              // getAlphaSecondaryValue(swimmer.absent)
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(top: 8.0, right: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              getAlphaSecondaryTitle(
                                                  getAppLocalization(context).teamName),
                                              getAlphaSecondaryValue(
                                                  model.teamInfo.name )
                                            ],
                                          ),
                                        )),
                                  ],
                                ))
                          ],
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  getAlphaTeamsListView() {
    List<Widget> all = model.teamInfo.members!.map<Widget>((alphaTeam) {
      return getTeamSwimmerView(alphaTeam);
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

  showPublicProfile(String swimmerID) {
    Future.delayed(
        Duration.zero,
            () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<PublicProfileModel>(
                    create: (context) => PublicProfileModel(swimmerID: swimmerID),
                    child: PublicProfileRoute()))));
  }
  showTeamDetailsRoute(TeamInfo teamInfo) {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<TopSwimmersModel>(
                    create: (context) => TopSwimmersModel(),
                    child: TopSwimmersRoute()))));
  }
}
