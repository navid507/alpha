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
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';


class SwimmerRecordsRoute extends StatefulWidget {
  const SwimmerRecordsRoute({Key? key}) : super(key: key);

  @override
  _SwimmerRecordsRouteState createState() => _SwimmerRecordsRouteState();
}

class _SwimmerRecordsRouteState extends State<SwimmerRecordsRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      model.getAllSwimTypes();
    });
  }

  SwimmerRecordsModel get model =>
      Provider.of<SwimmerRecordsModel>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    alphaHeader = AlphaHeader(drawerContext: context);
    return Scaffold(
      drawer: getDrawerWithProvider(),
      body: Builder(
        builder: (drawerContext) => getScreenBody(drawerContext),
      ),
    );
  }

  Widget getDrawerWithProvider() {
    return ChangeNotifierProvider<DrawerModel>(
      create: (_) => DrawerModel(),
      child: AlphaDrawerWidget(page: AlphaRoutes.SwimmerRecords),
    );
  }

  Widget getScreenBody(BuildContext screenBodyContext) {
    return Stack(children: [
      alphaHeader.getImageOfHeader(),
      Column(children: [
        alphaHeader.getTopMenu(screenBodyContext),
        getTitle(),
        Expanded(child: getMainSectionView())
      ])
    ]);
  }

  Widget getTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: getAlphaPageTitleWhite(getAppLocalization(context).records),
    );
  }

  Widget getMainSectionView() {
    return Selector<SwimmerRecordsModel, LoadingState>(
      selector: (_, topSwimmerModel) => topSwimmerModel.allRecordsState,
      builder: (context, state, child) {
        switch (state) {
          case LoadingState.NotStarted:
          case LoadingState.Loading:
            return getLoadingView();
          case LoadingState.Loaded:
            return getScreenContent();
          case LoadingState.LoadError:
            return getRetryButton();
        }
      },
    );
  }

  Widget getScreenContent() {
    if (model.allRecords!.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getAlphaTextTitle2White(
              getAppLocalization(context).noRecordRegistered),
          getAlphaDialogButtonOk(
            text: getAppLocalization(context).back,
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
    return Column(
      children: [getChart(), Expanded(child: getRecordsListView())],
    );
  }

  Widget getChart() {
    List<FlSpot> spots = [];

    for (int i = 0; i < model.allRecords!.length; i++) {
      final record = model.allRecords![i];
      final y = record.record.toDouble();
      spots.add(FlSpot(i.toDouble(), y));
    }

    return SizedBox(
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AlphaColors.backDialog,
          ),
          child: LineChart(
            LineChartData(
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 32,
                    interval: 1,
                    getTitlesWidget: (value, _) {
                      int index = value.toInt();
                      if (index < model.allRecords!.length) {
                        String date = model.allRecords![index].date;
                        if (date.length > 7) {
                          return Text(date.substring(2, 7),
                              style:
                              TextStyle(fontSize: 10, color: Colors.white));
                        }
                      }
                      return Text('');
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      double seconds = value / 100;
                      int min = seconds ~/ 60;
                      int sec = (seconds % 60).toInt();
                      return Text(
                        min == 0 ? "${sec}s" : "${min}m${sec}s",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
                rightTitles:
                AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                AxisTitles(sideTitles: SideTitles(showTitles: false)),
              ),
              borderData: FlBorderData(show: true),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: Colors.yellow,
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: Colors.yellow.withOpacity(0.2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getRecordsListView() {
    return ListView(
      shrinkWrap: true,
      children: model.allRecords!.map((record) {
        return getRecordTypeView(record);
      }).toList(),
    );
  }

  Widget getRecordTypeView(Record record) {
    return GestureDetector(
      onTap: () {
        showRecordsOfSwimType(record);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AlphaColors.backDrawer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getAlphaTextBodyGrayLight(record.date),
              getAlphaTextSessionDescription(record.subject),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border:
                    Border.all(color: AlphaColors.Yellow, width: 0.5),
                  ),
                  alignment: Alignment.center,
                  child: getAlphaTextRecordTime(record.time),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getLoadingView() {
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

  Widget getRetryButton() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: getAlphaDialogButtonOk(
        text: getAppLocalization(context).retry,
        onPressed: () {
          model.getAllSwimTypes();
        },
      ),
    );
  }

  void showRecordsOfSwimType(Record record) {
    // TODO: پیاده‌سازی جزئیات
  }
}

