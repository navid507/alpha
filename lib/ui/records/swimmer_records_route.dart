import 'package:alpha/back/accounting/models/record/record.dart';
import 'package:alpha/back/periods/models/session/session.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/records/swimmer_records_model.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:collection/collection.dart';

class SwimmerRecordsRoute extends StatefulWidget {
  const SwimmerRecordsRoute({Key? key}) : super(key: key);

  @override
  _SwimmerRecordsRouteState createState() => _SwimmerRecordsRouteState();
}

class _SwimmerRecordsRouteState extends State<SwimmerRecordsRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getAllSwimTypes();
    });
    super.initState();
  }

  SwimmerRecordsModel get model =>
      Provider.of<SwimmerRecordsModel>(context, listen: false);

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
      child: AlphaDrawerWidget(page: AlphaRoutes.SwimmerRecords),
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
    return Selector<SwimmerRecordsModel, LoadingState>(
        selector: (_, topSwimmerModel) => topSwimmerModel.allRecordsState,
        builder: (context, state, child) {
          switch (state) {
            case LoadingState.NotStarted:
            case LoadingState.Loading:
              {
                return getLoadingView();
              }
            case LoadingState.Loaded:
              {
                return getScreenContent();
              }
            case LoadingState.LoadError:
              return getRetryButton();
          }
        });
  }

  getScreenContent() {
    if (model.allRecords!.isEmpty) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        getAlphaTextTitle2White(getAppLocalization(context).noRecordRegistered),
        getAlphaDialogButtonOk(
            text: getAppLocalization(context).back,
            onPressed: () {
              Navigator.of(context).pop();
            })
      ]);
    }
    return Column(
      children: [getChart(), Expanded(child: getRecordsListView())],
    );
  }

  late List<charts.Series<dynamic, num>> seriesList;

  getChart() {
    var chartsData = charts.Series<Record, int>(
        id: model.swimType.title,
        data: model.allRecords!,
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        measureFn: (Record record, _) => record.record,
        domainFn: (Record record, __) => record.sequence);
    List<charts.Series<dynamic, num>> chartsDataList =
        List.empty(growable: true);
    chartsDataList.add(chartsData);
    final recordTickFormatter =
        charts.BasicNumericTickFormatterSpec((valueString) {
      if (valueString != null) {
        var value = valueString.toInt() / 100;
        int min = value ~/ 60;
        int sec = (value % 60).toInt();

        if (min == 0) {
          return "${sec.toInt()}s";
        } else {
          return "${min}m${sec.toInt()}s";
        }
      }
      return "";
      // return r.time;
    });
    final dateTickFormatter =
        charts.BasicNumericTickFormatterSpec((valueString) {
      if (valueString != null) {
        var value = valueString.toInt();
        if (value < model.allRecords!.length) {
          if (model.allRecords![value].date.length > 7) {
            return model.allRecords![value].date.substring(2, 7);
          }
        }
      }

      return "";
      // return r.time;
    });
    return SizedBox(
      width: getScreenWidth(context),
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AlphaColors.backDialog,
          ),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: charts.LineChart(
              chartsDataList,
              primaryMeasureAxis: charts.NumericAxisSpec(
                  renderSpec: charts.SmallTickRendererSpec(
                      labelOffsetFromAxisPx: 8,
                      minimumPaddingBetweenLabelsPx: 45,
                      labelStyle: charts.TextStyleSpec(
                          fontFamily: 'AlphaFonts',
                          fontSize: 10,
                          color: charts.MaterialPalette.white)),
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false),
                  // viewport: charts.NumericExtents(Record.actualMin, Record.max),
                  tickFormatterSpec: recordTickFormatter),
              behaviors: [charts.PanAndZoomBehavior()],
              domainAxis: charts.NumericAxisSpec(
                  tickFormatterSpec: dateTickFormatter,
                  renderSpec: charts.SmallTickRendererSpec(
                      labelOffsetFromAxisPx: 25,
                      minimumPaddingBetweenLabelsPx: 5,
                      labelRotation: -45,
                      labelStyle: charts.TextStyleSpec(
                          fontFamily: 'AlphaFonts',
                          fontSize: 10,
                          color: charts.MaterialPalette.white)),
                  tickProviderSpec:
                      charts.BasicNumericTickProviderSpec(zeroBound: false)),
              defaultRenderer: charts.LineRendererConfig(
                  includeArea: true, stacked: true, includePoints: true),
              animate: true,
            ),
          ),
        ),
      ),
    );
  }

  getRecordsListView() {
    List<Widget> all = model.allRecords!.map<Widget>((period) {
      return getRecordTypeView(period);
    }).toList();
    return ListView(
      children: all,
      shrinkWrap: true,
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
              model.getAllSwimTypes();
            }));
  }

  getRecordTypeView(Record record) {
    return GestureDetector(
      onTap: () {
        showRecordsOfSwimType(record);
      },
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AlphaColors.backDrawer),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  getAlphaTextBodyGrayLight(record.date),
                  getAlphaTextSessionDescription(record.subject),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: AlphaColors.Yellow, width: 0.5)),
                      alignment: Alignment.center,
                      child: getAlphaTextRecordTime(record.time),
                    ),
                  )
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

  showRecordsOfSwimType(Record record) {}
}
