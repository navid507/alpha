import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/alpha_text_field.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/session_details_dialog/session_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SessionDetailsDialog extends StatefulWidget {
  const SessionDetailsDialog({Key? key}) : super(key: key);

  @override
  _SessionDetailsDialogState createState() => _SessionDetailsDialogState();
}

class _SessionDetailsDialogState extends State<SessionDetailsDialog> {
  final swimmerScoreTEC = TextEditingController();
  final swimmerDescTEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  SessionDetailsModel get model =>
      Provider.of<SessionDetailsModel>(context, listen: false);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      setValues();
      model.setScoreStream.listen((state) {
        if (state == LoadingState.Loaded) {
          Navigator.pop(context, StateResult(msg: "registered", error: 0));
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            color: AlphaColors.background,
            borderRadius: BorderRadius.circular(8)),
        width: getScreenWidth(context) - 40,
        height: 416,
        child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.only(top: 12.0),
              width: getScreenWidth(context),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: getAlphaTextHeaderWhite(
                          getAppLocalization(context).sessionDetails)),
                  Container(
                      color: AlphaColors.backDrawer,
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/ic_menu_periods_session.png',
                            width: 45,
                          ),
                          getVerticalLine(),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 4, bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    getAlphaTextBodyGrayLight(
                                        "${getAppLocalization(context).sessionDate}: "),
                                    getAlphaTextBodyWhite(model.curSession.date)
                                  ],
                                ),
                                Row(
                                  children: [
                                    getAlphaTextBodyGrayLight(
                                        "${getAppLocalization(context).sessionScore}: "),
                                    getAlphaTextBodyYellow(
                                        model.curSession.score)
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                      width: getScreenWidth(context),
                      alignment: Alignment.topRight,
                      color: AlphaColors.backDrawer,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getAlphaTextBodyGrayLight(
                                  getAppLocalization(context).coachDescription),
                              getAlphaTextTitle2White(
                                  model.curSession.description),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.0),
                                  child: getHorizontalLine()),
                              getAlphaTextBodyGrayLight(
                                  getAppLocalization(context).swimmerScore),
                              getAlphaTextFormFieldNumber(
                                  validator: (scoreText) {
                                    {
                                      if (scoreText != null) {
                                        var score = int.tryParse(scoreText);

                                        if (score != null &&
                                            score < 10 &&
                                            score > 0) {
                                          return null;
                                        } else {
                                          if (score == null) {
                                            return getAppLocalization(context)
                                                .pleaseFillTheField;
                                          } else {
                                            return getAppLocalization(context)
                                                .scoreShouldBeBetweenZeroAndTen;
                                          }
                                        }
                                      } else {
                                        return getAppLocalization(context)
                                            .pleaseFillTheField;
                                      }
                                    }
                                  },
                                  hint:
                                      getAppLocalization(context).swimmerScore,
                                  textEditingController: swimmerScoreTEC),
                              getAlphaTextBodyGrayLight(
                                  getAppLocalization(context).swimmerDescription),
                              getAlphaTextFormFieldNormal(
                                  validator: (descText) {
                                    if (descText == null || descText.isEmpty) {
                                      return getAppLocalization(context)
                                          .pleaseFillTheField;
                                    }
                                    return null;
                                  },
                                  hint: getAppLocalization(context)
                                      .swimmerDescription,
                                  textEditingController: swimmerDescTEC),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: getScreenWidth(context),
                                    child: getAlphaDialogButtonOk(
                                        text: getAppLocalization(context)
                                            .register,
                                        onPressed: () {
                                          applyComment();
                                        })),
                              )
                            ]),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  getVerticalLine() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        color: AlphaColors.White.withAlpha(100),
        width: 1,
        height: 25,
      ),
    );
  }

  getHorizontalLine() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        color: AlphaColors.White.withAlpha(100),
        width: getScreenWidth(context),
        height: 2,
      ),
    );
  }

  setValues() {
    swimmerDescTEC.text = model.curSession.swimmerDescription;
    swimmerScoreTEC.text = model.curSession.swimmerScore;
  }

  applyComment() {
    if (_formKey.currentState!.validate()) {
      model.setScoreAndComment(swimmerScoreTEC.text, swimmerDescTEC.text);
    }
  }
}
