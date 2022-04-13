import 'package:alpha/back/periods/models/period/period.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/payment_dialog/payment_dialog.dart';
import 'package:alpha/ui/payment_dialog/payment_dialog_model.dart';
import 'package:alpha/ui/periods/periods_model.dart';
import 'package:flutter/material.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/drawer/alpha_drawer_widget.dart';
import 'package:alpha/ui/drawer/drawer_model.dart';
import 'package:alpha/ui/drawer/get_header.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:provider/provider.dart';

class RulesRoute extends StatefulWidget {
  final Period period;

  RulesRoute({Key? key, required this.period}) : super(key: key);

  @override
  _RulesRouteState createState() => _RulesRouteState();
}

class _RulesRouteState extends State<RulesRoute> {
  late AlphaHeader alphaHeader;

  @override
  void initState() {
    super.initState();
  }

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
      child: AlphaDrawerWidget(page: AlphaRoutes.Rules),
    );
  }

  getScreenBody(BuildContext screenBodyContext) {
    return Stack(children: [
      alphaHeader.getImageOfHeader(),
      Column(children: [
        alphaHeader.getTopMenu(screenBodyContext),
        getTitle(),
        Expanded(
          child: Stack(
            children: [
              Padding(padding: EdgeInsets.only(top: 32), child: getRules()),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 0),
                child: Container(
                  child: Image.asset(
                    "assets/images/im_rules.png",
                    width: 96,
                    height: 96,
                  ),
                  alignment: Alignment.topLeft,
                ),
              ),
            ],
          ),
        )
      ]),
    ]);
  }

  getTitle() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: getAlphaPageTitleWhite(getAppLocalization(context).alphaRules));
  }

  getRules() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          alignment: Alignment.topRight,
          decoration: BoxDecoration(
              color: AlphaColors.backDialog,
              borderRadius: BorderRadius.circular(12)),
          width: getScreenWidth(context),
          padding: EdgeInsets.only(top: 16),
          child: getListOfRules(),
        ));
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

  getHorizontalLine() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Container(
        height: 1,
        width: getScreenWidth(context),
        color: AlphaColors.White.withAlpha(50),
      ),
    );
  }

  getListOfRules() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          getRule("1", getAppLocalization(context).condition1),
          getHorizontalLine(),
          getRule("2", getAppLocalization(context).condition2),
          getHorizontalLine(),
          getRule("3", getAppLocalization(context).condition3),
          getHorizontalLine(),
          getRule("4", getAppLocalization(context).condition4),
          getHorizontalLine(),
          getRule("5", getAppLocalization(context).condition5),
          getHorizontalLine(),
          getRule("6", getAppLocalization(context).condition6),
          getHorizontalLine(),
          getRule("7", getAppLocalization(context).condition7),
          getHorizontalLine(),
          getRule("8", getAppLocalization(context).condition8),
          getHorizontalLine(),
          getRule("9", getAppLocalization(context).condition9),
          getHorizontalLine(),
          getRule("10", getAppLocalization(context).condition10),
          getHorizontalLine(),
          getRule("11", getAppLocalization(context).condition11),
          getHorizontalLine(),
          getRule("12", getAppLocalization(context).condition12),
          getHorizontalLine(),
          getRule("13", getAppLocalization(context).condition13),
          getHorizontalLine(),
          getRule("14", getAppLocalization(context).condition14),
          getHorizontalLine(),
          getRule("15", getAppLocalization(context).condition15),
          getHorizontalLine(),
          getRule("16", getAppLocalization(context).condition16),
          getHorizontalLine(),
          getRule("17", getAppLocalization(context).condition17),
          getHorizontalLine(),
          getRule("18", getAppLocalization(context).condition18),
          getHorizontalLine(),
          getRule("19", getAppLocalization(context).condition19),
          getHorizontalLine(),
          getRule("20", getAppLocalization(context).condition20),
          getHorizontalLine(),
          getRule("21", getAppLocalization(context).condition21),
          getHorizontalLine(),
          getAlphaDialogButtonOk(
              text: getAppLocalization(context).acceptRules,
              onPressed: () {
                showPayment();
              }),
          getAlphaDialogButtonCancel(
              text: getAppLocalization(context).back,
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
    );
  }

  getRule(String num, String text) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 32,
            height: 32,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AlphaColors.Yellow, width: 2)),
            child: getAlphaTextRuleNumber(num),
          ),
        ),
        Expanded(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: getAlphaTextBodyWhite(text)),
        ),
      ],
    );
  }

  showPayment() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: getPaymentDialog(),
          );
        }).then((result) {
      if (result) {
        Navigator.pop(context, true);
        // model.getConnectedSwimmers();
      }
    });
  }

  getPaymentDialog() {
    return ChangeNotifierProvider<PaymentDialogModel>(
      create: (_) {
        return PaymentDialogModel(period: this.widget.period);
      },
      child: PaymentDialog(),
    );
  }
}
