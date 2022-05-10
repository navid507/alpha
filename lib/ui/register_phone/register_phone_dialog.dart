import 'package:alpha/ui/alpha_dialog/alpha_dialog.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/register_phone/register_phone_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPhoneDialog extends StatefulWidget {
  const RegisterPhoneDialog({Key? key}) : super(key: key);

  @override
  _RegisterPhoneDialogState createState() => _RegisterPhoneDialogState();
}

class _RegisterPhoneDialogState extends State<RegisterPhoneDialog> {
  @override
  void initState() {
    // Provider.of<RegisterPhoneModel>(context, listen: false);

    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<RegisterPhoneModel>(context, listen: false)
          .registerPhoneStateStream
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
    return Selector<RegisterPhoneModel, DialogState>(
      selector: (_, model) => model.state,
      builder: (dialogContext, state, child) {
        return initialDialog(state);
      },
    );
  }

  initialDialog(DialogState dialogState) {
    return AlphaDialog(
        validator: (value) {
          if (value != null) {
            if (isPhoneValid(value)) {
              return null;
            }
          }
          return getAppLocalization(context).pleaseEnterValidPhone;
        },
        defaultText: '',
        title: getAppLocalization(context).registerPhone,
        icon: 'assets/images/im_register_phone.png',
        desc: getAppLocalization(context).enterPhoneNumber,
        hint: getAppLocalization(context).enterPhoneNumber,
        errorText:
            Provider.of<RegisterPhoneModel>(context, listen: false).error,
        buttonOkText: getAppLocalization(context).registerPhone,
        buttonCancelText: getAppLocalization(context).cancel,
        onCancelAction: () {
          Navigator.of(context).pop();
        },
        dialogState: dialogState,
        onMainAction: (tfController) {
          if (tfController is TextEditingController) {
            Provider.of<RegisterPhoneModel>(context, listen: false)
                .registerPhone(phone: tfController.text);
          }
        });
  }

// loadingDialog() {
//   return AlphaDialog(
//       title: getAppLocalization(context).registerPhone,
//       icon: 'assets/images/im_register_phone.png',
//       desc: getAppLocalization(context).enterPhoneNumber,
//       hint: getAppLocalization(context).enterPhoneNumber,
//       buttonOkText: getAppLocalization(context).loading,
//       buttonCancelText: getAppLocalization(context).cancel,
//       dialogState: true,
//       onCancelAction: () {},
//       onMainAction: (phone) {});
// }

}
