import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/period_sessions/period_sessions_model.dart';
import 'package:alpha/ui/session_details_dialog/session_details_dialog.dart';
import 'package:alpha/ui/session_details_dialog/session_details_model.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:provider/provider.dart';

class PeriodSessionsRoute extends StatefulWidget {
  const PeriodSessionsRoute({Key? key}) : super(key: key);

  @override
  _PeriodSessionsRouteState createState() => _PeriodSessionsRouteState();
}

class _PeriodSessionsRouteState extends State<PeriodSessionsRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAllPeriodSessions();
    });
    super.initState();
  }

  PeriodSessionsModel get model =>
      Provider.of<PeriodSessionsModel>(context, listen: false);

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
        child:
            getAlphaPageTitleWhite(getAppLocalization(context).periodSessions));
  }

  getMainSectionView() {
    return Selector<PeriodSessionsModel, LoadingState>(
        selector: (_, topSwimmerModel) =>
            topSwimmerModel.allPeriodSessionsState,
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
    List<Widget> all = model.allPeriodSessions!.map<Widget>((period) {
      return getSessionView(period);
    }).toList();
    return GridView.count(
        childAspectRatio: 0.9, crossAxisCount: 2, children: all);
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
              model.getAllPeriodSessions();
            }));
  }

  getSessionView(Session session) {
    return GestureDetector(
      onTap: () {
        showSessionDialog(session);
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AlphaColors.backDrawer),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: 8, right: 12),
                          child: getAlphaTextBodyWhite(session.date)),
                      Spacer(),
                      getSessionState(session.sessionState)
                    ],
                  ),
                  Container(
                    width: 34,
                    decoration: (session.sessionState == SessionState.Present)
                        ? BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                color: AlphaColors.White, width: 0.0))
                        : null,
                    alignment: Alignment.center,
                    child: (session.sessionState == SessionState.Present)
                        ? getAlphaTextSessionScore(session.score)
                        : getAlphaTextSessionScore(''),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 8, right: 12, left: 4),
                      child:
                          getAlphaTextSessionDescription(session.description)),
                  getHorizontalLine(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: getAlphaTextBodyGrayLight(
                            getAppLocalization(context).swimmerDescription)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            decoration: (session.swimmerScore.isNotEmpty)
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                        color: AlphaColors.White, width: 0.5))
                                : null,
                            alignment: Alignment.center,
                            child: getAlphaTextBodyWhite(session.swimmerScore),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 12),
                            child: getAlphaTextMoreWhite(
                                session.swimmerDescription))
                      ],
                    ),
                  ),
                ],
              ))),
    );
  }

  getHorizontalLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Container(
        color: AlphaColors.White.withAlpha(30),
        width: getScreenWidth(context),
        height: 1,
      ),
    );
  }

  getVerticalLine() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        color: AlphaColors.White.withAlpha(30),
        width: 1,
        height: 15,
      ),
    );
  }

  getSessionState(SessionState state) {
    var text = getAlphaTextBodyWhite('');
    var color = AlphaColors.backDrawer;
    switch (state) {
      case SessionState.NotSpecified:
        text = getAlphaTextTitle1WhiteFit(
            getAppLocalization(context).noSessionYet);

        color = AlphaColors.backTopSwimmers;
        break;
      case SessionState.Absent:
        text = getAlphaTextTitle1White(getAppLocalization(context).absent);
        color = AlphaColors.Red;
        break;
      case SessionState.Present:
        text = getAlphaTextTitle1Dark(getAppLocalization(context).present);
        color = AlphaColors.Yellow;
        break;
    }

    return Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(16), topLeft: Radius.circular(8.0))),
      width: 50,
      alignment: Alignment.center,
      child: Padding(padding: EdgeInsets.all(4), child: text),
    );
  }

  showSessionDialog(Session session) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: getSessionDialog(session),
          );
        }).then((registerState) {
      if (registerState is StateResult && registerState.isSuccess) {
        model.getAllPeriodSessions();
      }
    });
  }

  getSessionDialog(Session session) {
    return ChangeNotifierProvider<SessionDetailsModel>(
      create: (_) {
        return SessionDetailsModel(curSession: session);
      },
      child: SessionDetailsDialog(),
    );
  }
}
