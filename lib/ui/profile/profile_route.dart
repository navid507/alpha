import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/back/periods/models/period/registered_period.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/period_sessions/period_sessions_model.dart';
import 'package:alpha/ui/period_sessions/period_sessions_route.dart';
import 'package:alpha/ui/periods/period_route.dart';
import 'package:alpha/ui/periods/periods_model.dart';
import 'package:alpha/ui/profile/profile_model.dart';
import 'package:alpha/ui/register_swimmer/register_swimmer_dialog.dart';
import 'package:alpha/ui/register_swimmer/register_swimmer_model.dart';
import 'package:alpha/ui/swim_types/swim_types_model.dart';
import 'package:alpha/ui/swim_types/swim_types_route.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:provider/provider.dart';

import '../period_survey/survey_route.dart';

class ProfileRoute extends StatefulWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  _ProfileRouteState createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getActiveSwimmer();
      model.getCurActivePeriodDetails();
    });
    super.initState();
  }

  ProfileModel get model => Provider.of<ProfileModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    alphaHeader = AlphaHeader(drawerContext: context);
    return Scaffold(
        drawer: getDrawerWithProvider(),
        body: Builder(builder: (context) {
          return getMainSectionView(context);
        }));
  }

  getDrawerWithProvider() {
    return ChangeNotifierProvider<DrawerModel>(
      create: (_) {
        return DrawerModel();
      },
      child: AlphaDrawerWidget(page: AlphaRoutes.Profile),
    );
  }

  getTitle() {
    return Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: getAlphaPageTitleWhite(getAppLocalization(context).userProfile));
  }

  getMainSectionView(BuildContext buildContext) {
    return Selector<ProfileModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.profileState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return getLoadingView();
              }
            case LoadingState.Loaded:
              {
                Swimmer profile = model.activeSwimmer!;
                return getProfileView(profile, buildContext);
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
  }

  getPeriodDetailsSessionsView() {
    return Selector<ProfileModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.curPeriodDetailsState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return getLoadingView();
              }
            case LoadingState.Loaded:
              {
                RegisteredPeriod? period = model.activePeriod;
                if (period != null) {
                  return getPeriodSessionView(period);
                } else {
                  return Container();
                }
              }
            case LoadingState.LoadError:
              return getRetryButtonPeriodDetails();
          }
        });
  }

  getPeriodSessionView(RegisteredPeriod period) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        height: 70,
        color: AlphaColors.background.withAlpha(100),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              getSessionInfoColumn(period.allSessions,
                  getAppLocalization(context).allPeriodSessions),
              getSplitterLine(),
              getSessionInfoColumn(
                  period.presents, getAppLocalization(context).presentSessions),
              getSplitterLine(),
              getSessionInfoColumn(period.absents,
                  getAppLocalization(context).absentsSessionNumber),
              getSplitterLine(),
              getSessionInfoColumn(period.passedSession,
                  getAppLocalization(context).passedSession),
              getSplitterLine(),
              getSessionInfoColumn(period.remainedSessions,
                  getAppLocalization(context).remainedSessions),
            ],
          ),
        ),
      ),
    );
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

  getSessionInfoColumn(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          getAlphaTextHeaderWhite(title),
          getAlphaTextMoreWhite(value)
        ],
      ),
    );
  }

  getPeriodDetailsTitleView() {
    return Selector<ProfileModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.curPeriodDetailsState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return getLoadingView();
              }
            case LoadingState.Loaded:
              {
                return getPeriodTitleView(model.activePeriod);
              }
            case LoadingState.LoadError:
              return getRetryButtonPeriodDetails();
          }
        });
  }

  getPeriodTitleView(RegisteredPeriod? period) {
    if (period != null) {
      return getCurrentPeriodView(period);
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          getAlphaTextBodyWhite(
              getAppLocalization(context).youHaveNotAnyActivePeriod),
          getAlphaDialogButtonOk(
              text: getAppLocalization(context).registerNow,
              onPressed: () {
                showPeriodsRoute();
              })
        ]),
      );
    }
  }

  getCurrentPeriodView(RegisteredPeriod period) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        color: AlphaColors.backDialog,
        child: Column(
          children: [
            Row(
              children: [
                getAlphaTextHeaderWhite(period.name),
                Spacer(),
                getAlphaTextTitle1Yellow(getAppLocalization(context).periodCost)
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AlphaColors.White.withAlpha(50),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      getAlphaTextTitle2White(period.description),
                      Row(
                        children: [
                          getAlphaTextTitle1White(
                              getAppLocalization(context).periodLevel),
                          getSplitterLine(),
                          getAlphaTextTitle1Yellow(period.level)
                        ],
                      ),
                      getHorizontalLine(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            getAvatarImageTeacherSmall(period.teacherImage),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getAlphaTextBodyWhite(
                                      getAppLocalization(context).coachName),
                                  getAlphaTextBodyYellow(period.teacher)
                                ],
                              ),
                            ),
                            Spacer(),
                            getAvatarImagePeriodSmall(
                                "assets/images/ic_pool.png"),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getAlphaTextBodyWhite(
                                      getAppLocalization(context).poolName),
                                  getAlphaTextBodyYellow(period.poolName)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/ic_date.png",
                  width: 25,
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: getAlphaTextMoreWhite(
                            "${getAppLocalization(context).periodStart}: ${period.startDate} ")),
                    getAlphaTextMoreWhite(
                        "${getAppLocalization(context).periodEnd}: ${period.endDate}")
                  ],
                ),
                Spacer(),
                Image.asset(
                  "assets/images/ic_time.png",
                  width: 25,
                ),
                Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: getAlphaTextMoreWhite(
                            "${getAppLocalization(context).periodStartTime}: ${period.startTIme} ")),
                    getAlphaTextMoreWhite(
                        "${getAppLocalization(context).periodEndTime}: ${period.endTIme}")
                  ],
                )
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 8.0, bottom: 4),
                child: getHorizontalLine()),
            getPeriodAccessorise(periodID: period.id, userID: period.userID)
          ],
        ),
      ),
    );
  }


  getHorizontalLine() {
    return Container(
      color: AlphaColors.White.withAlpha(30),
      width: getScreenWidth(context),
      height: 1,
    );
  }

  getPeriodAccessorise({required String periodID, required String userID}) {
    return Column(children: [
      Row(
        children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: getPeriodButton(
                      title: getAppLocalization(context).periodSessions,
                      icon: "assets/images/ic_menu_periods_session.png",
                      onTap: () {
                        showPeriodSessionsRoute();
                      }))),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: getPeriodButton(
                      title: getAppLocalization(context).medicalSessions,
                      icon: "assets/images/ic_doctor.png",
                      onTap: () {
                        showMedicalRoute();
                      }))),
        ],
      ),
      Row(
        children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: getPeriodButton(
                      title: getAppLocalization(context).survey,
                      icon: "assets/images/ic_survey.png",
                      onTap: () {
                        showSurveyRoute(periodID: periodID, userID: userID);
                      }))),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: getPeriodButton(
                      title: getAppLocalization(context).records,
                      icon: "assets/images/ic_records.png",
                      onTap: () {
                        showRecordsRoute();
                      }))),
        ],
      )
    ]);
  }

  getPeriodButton(
      {required String title,
      required String icon,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
          decoration: BoxDecoration(
              color: AlphaColors.TextGray,
              borderRadius: BorderRadius.circular(8.0),
              border: Border()),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  icon,
                  width: 30,
                ),
                getAlphaTextBodyWhite(title)
              ],
            ),
          ),
        ),
      ),
    );
  }

  getProfileView(Swimmer profile, BuildContext buildContext) {
    var screenHeight = getScreenHeight(context);
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    color: AlphaColors.background,
                    child:
                        getImageOfProfile(profile.publicImage ?? profile.image),
                    width: getScreenWidth(context),
                    height: screenHeight / 2.6,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: getAvatarImageProfile(profile.image)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                            alignment: Alignment.bottomRight,
                            child: getAlphaTextHeaderWhite(profile.fullName)),
                      ),
                      getScoreRow(profile.score ?? ""),
                      getPeriodDetailsSessionsView()
                    ],
                  ),
                ],
              ),
            ),
            getPeriodDetailsTitleView()
          ],
        ),
        alphaHeader.getTopMenu(buildContext),
      ],
    );
  }

  getScoreRow(String score) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(children: [
        getAlphaTextBodyWhite("${getAppLocalization(context).score}: "),
        getAlphaTextBodyYellow(score),
        getAlphaTextBodyWhite(" | "),
        GestureDetector(
          child: getAlphaTextBodyWhite(getAppLocalization(context).edit),
          onTap: () {
            showEditDialog();
          },
        )
      ]),
    );
  }

  getImageOfProfile(String image) {
    return Opacity(
        opacity: 0.4,
        child: Image(
            image: NetworkImage(image),
            fit: BoxFit.fitWidth,
            alignment: Alignment.center));
  }

  getProfileSection(Swimmer profile) {
    return Container();
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
              model.getActiveSwimmer();
            }));
  }

  getRetryButtonPeriodDetails() {
    return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(5.0),
        child: getAlphaDialogButtonOk(
            text: getAppLocalization(context).retry,
            onPressed: () {
              setState(() {
                model.getCurActivePeriodDetails();
              });
            }));
  }

  showEditDialog() {
    showRegisterSwimmerDialog(model.activeSwimmer!);
  }

  showPeriodsRoute() {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<PeriodsModel>(
                    create: (context) => PeriodsModel(),
                    child: PeriodRoute()))));
  }

  showRecordsRoute() {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider<SwimTypesModel>(
                    create: (context) => SwimTypesModel(),
                    child: SwimTypesRoute()))));
  }

  showMedicalRoute() {
    // Future.delayed(
    //     Duration.zero,
    //         () => Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => ChangeNotifierProvider<MedicalModel>(
    //                 create: (context) => MedicalModel(),
    //                 child: MedicalRoute()))));
  }

  showSurveyRoute({required String periodID, required String userID}) {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SurveyRoute(
                      periodID: periodID,
                      userID: userID,
                    ))));
  }

  showPeriodSessionsRoute() {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChangeNotifierProvider<PeriodSessionsModel>(
                        create: (context) => PeriodSessionsModel(),
                        child: PeriodSessionsRoute()))));
  }

  showRegisterSwimmerDialog(Swimmer swimmer) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: getRegisterSwimmerDialog(swimmer),
          );
        }).then((registerState) {
      if (registerState is StateResult && registerState.isSuccess) {
        model.getActiveSwimmer();
      }
    });
  }

  getRegisterSwimmerDialog(Swimmer swimmer) {
    return ChangeNotifierProvider<RegisterSwimmerModel>(
      create: (_) {
        return RegisterSwimmerModel(swimmer: swimmer);
      },
      child: RegisterSwimmerDialog(),
    );
  }
}
