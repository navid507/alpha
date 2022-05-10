import 'package:alpha/back/periods/periods_repo.dart';
import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/Models/loading_state.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/alpha_text_field.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:alpha/ui/payment_dialog/payment_dialog_model.dart';
import 'package:alpha/ui/session_details_dialog/session_details_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentDialog extends StatefulWidget {
  const PaymentDialog({Key? key}) : super(key: key);

  @override
  _PaymentDialogState createState() => _PaymentDialogState();
}

class _PaymentDialogState extends State<PaymentDialog> {
  final swimmerScoreTEC = TextEditingController();
  final swimmerDescTEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  PaymentDialogModel get model =>
      Provider.of<PaymentDialogModel>(context, listen: false);

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      // model.setScoreStream.listen((state) {
      //   if (state == LoadingState.Loaded) {
      //     Navigator.pop(context, StateResult(msg: "registered", error: 0));
      //   }
      // });
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
            height: 300,
            child: Form(key: _formKey, child: getDialogContent())));
  }

  getDialogContent() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        child: Column(
          children: [
            getAlphaTextHeaderWhite(getAppLocalization(context).paymentMethod),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 36),
              child: getHorizontalLine(),
            ),
            getAlphaTextBodyGrayLight(
                getAppLocalization(context).howYouWantToPay),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // getPaymentMethodView(getAppLocalization(context).online,
                  //     "assets/images/im_online.png", () {
                  //   model.doRegister(PaymentType.Online);
                  // }),
                  getPaymentMethodView(getAppLocalization(context).cash,
                      "assets/images/im_cash.png", () {
                    model.doRegister(PaymentType.Cash);
                  }),
                  getPaymentMethodView(getAppLocalization(context).cart,
                      "assets/images/im_cart.png", () {
                    model.doRegister(PaymentType.Cart);
                  })
                ],
              ),
            ),
            getResultView()
          ],
        ),
      ),
    );
  }

  getPaymentMethodView(String text, String image, VoidCallback onTap) {
    return Expanded(
      child: Padding(
          padding: EdgeInsets.all(4),
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AlphaColors.White),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(image),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: getAlphaTextBodyGray(text))
                ],
              ),
            ),
          )),
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
        color: AlphaColors.White.withAlpha(50),
        width: getScreenWidth(context),
        height: 1,
      ),
    );
  }

  getResultView() {
    return Selector<PaymentDialogModel, DialogState>(
        selector: (_, paymentModel) => paymentModel.dialogState,
        builder: (context, state, child) {
          switch (state) {
            case DialogState.normal:
              return Container();
            case DialogState.loading:
              {
                return getLoadingView();
              }
            case DialogState.finish:
              {
                // return getLoadingView();
                return getFinishView();
              }
            case DialogState.formError:
            case DialogState.serverError:
              return getErrorView();
          }
        });
  }

  getLoadingView() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(
        backgroundColor: Colors.white,
        color: AlphaColors.Red,
        strokeWidth: 2.0,
      ),
      height: 20,
      width: 20,
    );
  }

  getFinishView() {
    return Column(
      children: [
        getAlphaTextAcceptBody(getAppLocalization(context).successPayment),
        getBackButton()
      ],
    );
  }

  getErrorView() {
    return Column(
      children: [
        getAlphaTextBodyWhite(getAppLocalization(context).errorPayment),
        getAlphaTextErrorEditText(model.error)
      ],
    );
  }

  getBackButton() {
    return getAlphaDialogButtonOk(
        text: getAppLocalization(context).back,
        onPressed: () {
          Navigator.pop(context, true);
        });
  }

  applyComment() {
    // if (_formKey.currentState!.validate()) {
    //   model.setScoreAndComment(swimmerScoreTEC.text, swimmerDescTEC.text);
    // }
  }
}
