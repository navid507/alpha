import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/periods/periods_model.dart';
import 'package:alpha/ui/rules/rules_route.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:provider/provider.dart';

class PeriodRoute extends StatefulWidget {
  const PeriodRoute({Key? key}) : super(key: key);

  @override
  _PeriodRoute createState() => _PeriodRoute();
}

class _PeriodRoute extends State<PeriodRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAllPeriods();
    });
    super.initState();
  }

  PeriodsModel get model => Provider.of<PeriodsModel>(context, listen: false);

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
      child: AlphaDrawerWidget(page: AlphaRoutes.Periods),
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
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: getAlphaPageTitleWhite(getAppLocalization(context).periods));
  }

  getMainSectionView() {
    return Selector<PeriodsModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.allPeriodsState,
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
                return getTopSwimmersListView();
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
  }

  getTopSwimmersListView() {
    List<Widget> all = model.allPeriods!.map<Widget>((period) {
      return getCurrentPeriodView(period);
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
              model.getAllPeriods();
            }));
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

  getCurrentPeriodView(Period period) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: AlphaColors.backDialog,
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(8),
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
                            getAvatarImageTeacherSmall(
                                period.teacherImage ?? ""),
                            Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  getAlphaTextBodyWhite(
                                      getAppLocalization(context).coachName),
                                  getAlphaTextBodyYellow(period.teacher ?? "")
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
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: getAlphaDialogButtonOk(
                            text: getAppLocalization(context).periodRegister,
                            onPressed: () {
                              showRules(period);
                            })))
              ],
            )
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

  showRules(Period period) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => RulesRoute(period: period)));
    if (result) {
      Navigator.pop(context);
    }
  }
}
