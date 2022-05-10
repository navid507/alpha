import 'package:alpha/back/accounting/models/record/record_type.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/records/swimmer_records_model.dart';
import 'package:alpha/ui/records/swimmer_records_route.dart';
import 'package:alpha/ui/swim_types/swim_types_model.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:provider/provider.dart';

class SwimTypesRoute extends StatefulWidget {
  const SwimTypesRoute({Key? key}) : super(key: key);

  @override
  _SwimTypesRouteState createState() => _SwimTypesRouteState();
}

class _SwimTypesRouteState extends State<SwimTypesRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAllSwimTypes();
    });
    super.initState();
  }

  SwimTypesModel get model =>
      Provider.of<SwimTypesModel>(context, listen: false);

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
        child: getAlphaPageTitleWhite(getAppLocalization(context).records));
  }

  getMainSectionView() {
    return Selector<SwimTypesModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.allSwimTypesState,
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
    List<Widget> all = model.allSwimTypes!.map<Widget>((period) {
      return getRecordTypeView(period);
    }).toList();
    return ListView(children: all);
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
              model.getAllSwimTypes();
            }));
  }

  getRecordTypeView(RecordType swimType) {
    return GestureDetector(
      onTap: () {
        showRecordsOfSwimType(swimType);
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AlphaColors.backDrawer),
              child: Row(
                children: [
                  getAlphaTextTitle2White(swimType.title),
                  Spacer(),
                  Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AlphaColors.Yellow,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AlphaColors.backDrawer,
                        size: 12,
                      ))
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

  showRecordsOfSwimType(RecordType swimType) {
    Future.delayed(
        Duration.zero,
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    ChangeNotifierProvider<SwimmerRecordsModel>(
                        create: (context) =>
                            SwimmerRecordsModel(swimType: swimType),
                        child: SwimmerRecordsRoute()))));
  }
}
