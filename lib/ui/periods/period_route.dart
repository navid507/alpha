import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/ui/periods/periods_model.dart';
import 'package:flutter/material.dart';
import 'package:alpha/back/public_repo/models/top_swimmers/top_swimmer.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/top_swimmers/top_swimmers_model.dart';
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
      return getPeriodView(period);
    }).toList();
    // all.insert(
    //     0,
    //     Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
    //         child: getAlphaPageTitleWhite(model.alphaTopSwimmers!.title)));
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

  getPeriodView(Period period) {
    return Padding(
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
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getAlphaTextTitle1White(period.name),
                      getAlphaTextMoreYellow(
                          " ${getAppLocalization(context).score}: ${period.price}"),
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
                                getAlphaSecondaryTitle(
                                    getAppLocalization(context)
                                        .practiseSessionNumber),
                                getAlphaSecondaryValue(period.description),
                                getAlphaSecondaryTitle(
                                    getAppLocalization(context)
                                        .absentsSessionNumber),
                                getAlphaSecondaryValue(period.endDate)
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
                                getAlphaSecondaryValue(period.name)
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
    );
  }
}
