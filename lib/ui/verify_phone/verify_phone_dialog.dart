import 'package:alpha/main_functions/main_models/api_result.dart';
import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/register_phone/register_phone_model.dart';
import 'package:alpha/ui/verify_phone/verify_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyPhoneDialog extends StatefulWidget {
  const VerifyPhoneDialog({Key? key}) : super(key: key);

  @override
  _RegisterPhoneDialogState createState() => _RegisterPhoneDialogState();
}

class _RegisterPhoneDialogState extends State<VerifyPhoneDialog> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<VerifyPhoneModel>(context, listen: false)
          .verifyPhoneStream
          .listen((registerState) {
        if (registerState.isSuccess) {
          Navigator.pop(context, registerState);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<VerifyPhoneModel, DialogState>(
      selector: (_, model) => model.state,
      builder: (dialogContext, state, child) {
        return initialDialog(state);
      },
    );
  }

  initialDialog(DialogState dialogState) {
    return AlphaDialog(
        validator: (code) {
          if (code != null) {
            if (isCodeValid(code)) {
              return null;
            }
          }
          return getAppLocalization(context).pleaseEnterValidCode;
        },
        defaultText: '',
        title: getAppLocalization(context).verifyCode,
        icon: 'assets/images/im_verify_code.png',
        desc: getAppLocalization(context).enterCode,
        hint: getAppLocalization(context).enterCode,
        errorText: Provider.of<VerifyPhoneModel>(context, listen: false).error,
        buttonOkText: getAppLocalization(context).verifyCode,
        buttonCancelText: getAppLocalization(context).changePhoneNumber,
        onCancelAction: () {
          Provider.of<VerifyPhoneModel>(context, listen: false).resetPhone();
          Navigator.pop(context, StateResult(msg: 'reset Phone', error: 0));
        },
        dialogState: dialogState,
        onMainAction: (tfController) {
          if (tfController is TextEditingController) {
            Provider.of<VerifyPhoneModel>(context, listen: false)
                .verifyPhone(code: tfController.text);
          }
        });
  }
}
