import 'package:alpha/ui/my_widgets/alpha_text.dart';
import 'package:alpha/ui/my_widgets/alpha_text_field.dart';
import 'package:alpha/ui/my_widgets/constant_widgets.dart';
import 'package:alpha/ui/my_widgets/constants.dart';
import 'package:flutter/material.dart';

enum DialogState { normal, loading, formError, serverEroor, finish }

class AlphaDialog extends StatefulWidget {
  final String title;
  final String defaultText;
  final String desc;
  final String hint;
  final String buttonOkText;
  final String buttonCancelText;
  final String icon;
  final Function? onMainAction;
  final Function? onCancelAction;
  final DialogState dialogState;
  final String errorText;
  final FormFieldValidator<String>? validator; // = (value) => null;

  const AlphaDialog(
      {Key? key,
      required this.title,
      required this.defaultText,
      required this.desc,
      required this.hint,
      this.errorText = "",
      required this.buttonOkText,
      required this.buttonCancelText,
      required this.icon,
      this.dialogState = DialogState.normal,
      this.onMainAction,
      this.validator,
      this.onCancelAction})
      : super(key: key);

  @override
  _AlphaDialogState createState() => _AlphaDialogState();
}

class _AlphaDialogState extends State<AlphaDialog> {
  final rpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      rpController.text = widget.defaultText;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Form(
        key: _formKey,
        child: Container(
            padding: EdgeInsets.all(12.0),
            width: getScreenWidth(buildContext),
            decoration: BoxDecoration(
                color: AlphaColors.backDialog,
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            child: ListView(children: [
              getAlphaTextTitle1White(widget.title),
              Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Image(image: AssetImage(widget.icon))),
              Container(
                  width: getScreenWidth(buildContext),
                  child: getAlphaTextTitleEditText(widget.desc)),
              Container(
                  width: getScreenWidth(context),
                  child: getAlphaTextFormFieldNumber(
                      validator: widget.validator,
                      hint: widget.hint,
                      textEditingController: rpController,
                      error: widget.errorText)),
              getMainButton(),
              getAlphaDialogButtonCancel(
                  text: widget.buttonCancelText,
                  onPressed: () {
                    widget.onCancelAction!();
                  })
            ])));
  }

  getMainButton() {
    switch (widget.dialogState) {
      case DialogState.normal:
      case DialogState.formError:
      case DialogState.serverEroor:
      case DialogState.finish:
        return getAlphaDialogButtonOk(
            text: widget.buttonOkText,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.onMainAction!(rpController);
              }
            });
      case DialogState.loading:
        return Stack(
          children: [
            Container(
              child: getAlphaDialogButtonOk(
                  text: widget.buttonOkText, onPressed: () {}),
              width: getScreenWidth(context),
            ),
            Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: AlphaColors.Yellow,
                strokeWidth: 1,
              ),
              height: 15,
              width: 15,
            )
          ],
          alignment: Alignment.center,
        );
    }
  }
}
