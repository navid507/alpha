import 'package:alpha/back/accounting/models/swimmer/swimmer.dart';
import 'package:alpha/back/accounting/models/swimmer/swimmers_result.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/my_widgets/user_image.dart';
import 'package:alpha/ui/register_swimmer/register_swimmer_model.dart';
import 'package:alpha/ui/register_swimmer/register_swimmer_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'change_user_model.dart';

class ChangeUserDialog extends StatefulWidget {
  const ChangeUserDialog({Key? key}) : super(key: key);

  @override
  _ChangeUserDialogState createState() => _ChangeUserDialogState();
}

class _ChangeUserDialogState extends State<ChangeUserDialog> {
  final rpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ChangeUserModel get model =>
      Provider.of<ChangeUserModel>(context, listen: false);

  @override
  void initState() {
    // Provider.of<RegisterPhoneModel>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      model.getConnectedSwimmers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return initialDialog();
    // return Selector<ChangeUserModel, DialogState>(
    //   selector: (_, model) => model.state,
    //   builder: (dialogContext, state, child) {
    //
    //   },
    // );
  }

  initialDialog() {
    return Form(
        key: _formKey,
        child: Container(
            padding: EdgeInsets.all(12.0),
            width: getScreenWidth(context),
            decoration: BoxDecoration(
                color: AlphaColors.backDialog,
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: Column(children: [
              Container(
                  padding: EdgeInsets.only(top: 8.0),
                  alignment: Alignment.center,
                  child: getAlphaTextTitle1White(
                      getAppLocalization(context).connectedSwimmers)),
              Padding(
                  padding: EdgeInsets.only(
                      left: 100, right: 100, top: 12, bottom: 24),
                  child: Container(
                    padding: EdgeInsets.all(90.0),
                    height: 2,
                    decoration:
                        BoxDecoration(color: AlphaColors.backTopSwimmers),
                    alignment: Alignment.center,
                  )),
              Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AlphaColors.White.withAlpha(10)),
                  padding: EdgeInsets.all(20.0),
                  child: Image(
                      width: 80,
                      height: 80,
                      image: AssetImage(
                          'assets/images/im_connected_swimmers.png'))),
              Container(
                height: 8,
                width: 1,
                color: AlphaColors.White.withAlpha(90),
              ),
              getConnectedSwimmersSection(),
              Container(
                  width: getScreenWidth(context),
                  child: getAlphaDialogButtonOk(
                      text: getAppLocalization(context).addNewSwimmers,
                      onPressed: () {
                        showRegisterSwimmerDialog();
                      })),
              Container(
                  width: getScreenWidth(context),
                  child: getAlphaDialogButtonCancel(
                      text: getAppLocalization(context).ok,
                      onPressed: () {
                        Navigator.pop(context, true);
                      }))
            ])));
  }

  getConnectedSwimmersSection() {
    return Selector<ChangeUserModel, SwimmersResult>(
      selector: (_, model) => model.getConnectedSwimmer,
      builder: (_, connectedSwimmersResult, __) {
        print("getConnectedSwimmersSection called:");
        if (connectedSwimmersResult is SuccessSwimmers) {
          print("success: ${connectedSwimmersResult.swimmers[0].isActive}");

          return getConnectedSwimmersList(
              swimmers: connectedSwimmersResult.swimmers);
        } else if (connectedSwimmersResult is ErrorSwimmers) {
          print("failed: ${connectedSwimmersResult.code}");
          if (connectedSwimmersResult.code > 0) {
            return getLoading();
          } else {
            return getAlphaTextMoreYellow(
                getAppLocalization(context).noConnectedSwimmersAvailable);
          }
        }
        return getAlphaTextMoreYellow(
            getAppLocalization(context).noConnectedSwimmersAvailable);
      },
    );
  }

  getConnectedSwimmersList({required List<Swimmer> swimmers}) {
    return Container(
        height: 160,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: swimmers
                .map<Widget>((s) => getConnectedSwimmer(swimmer: s))
                .toList()));
  }

  getConnectedSwimmer({required Swimmer swimmer}) {
    var height = 150.0;
    var width = 95.0;
    return InkWell(
        onTap: () {
          // Provider.of<ChangeUserModel>(context, listen: false)
          //     .changeActiveSwimmer(swimmer);
          context.read<ChangeUserModel>().changeActiveSwimmer(swimmer);
          setState(() {});
        },
        child: Column(children: [
          Container(
            height: 1,
            width: 95,
            color: AlphaColors.White.withAlpha(30),
          ),
          Container(
            height: 8,
            width: 1,
            color: AlphaColors.White.withAlpha(90),
          ),
          Container(
              padding: EdgeInsets.only(top: 2),
              height: height,
              width: width,
              child: Stack(
                children: [
                  getConnectedSwimmerBack(isSelected: swimmer.isActive),
                  Column(
                    children: [
                      (swimmer.isActive)
                          ? getAvatarImageConnectedSwimmerActive(swimmer.image)
                          : getAvatarImageConnectedSwimmer(swimmer.image),
                      Padding(
                          padding: EdgeInsets.all(0.0),
                          child: (swimmer.isActive)
                              ? getAlphaTextMoreYellow(swimmer.fullName)
                              : getAlphaTextMoreWhite(swimmer.fullName)),
                    ],
                  )
                ],
                alignment: Alignment.topCenter,
              ))
        ]));
  }

  getConnectedSwimmerBack(
      {required isSelected,
      double height = 90.0,
      double width = 80.0,
      double topPadding = 0}) {
    var border = Border.all(
        color: (isSelected) ? AlphaColors.Gold : AlphaColors.Red,
        width: (isSelected) ? 4 : 0);
    return Positioned(
      child: Opacity(
          opacity: 0.1,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: AlphaColors.White,
                border: border,
                borderRadius: BorderRadius.circular(5.0)),
          )),
      top: topPadding,
    );
  }

  getLoading() {
    return Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          alignment: Alignment.center,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
            color: AlphaColors.Yellow,
            strokeWidth: 1,
          ),
          height: 15,
          width: 15,
        ));
  }

  showRegisterSwimmerDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            child: getRegisterSwimmerDialog(),
          );
        }).then((registerState) {
      if (registerState is StateResult && registerState.isSuccess) {
        model.getConnectedSwimmers();
      }
    });
  }

  getRegisterSwimmerDialog() {
    return ChangeNotifierProvider<RegisterSwimmerModel>(
      create: (_) {
        return RegisterSwimmerModel(swimmer: Swimmer.emptySwimmer());
      },
      child: RegisterSwimmerDialog(),
    );
  }
}
