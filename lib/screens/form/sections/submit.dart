import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'alert_dialog.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({Key? key, required this.resetFormState}) : super(key: key);
  final ValueGetter<void> resetFormState;
  
  static const double _buttonHeight = 40;
  static const double _buttonElevation = 0;
  static const double _buttonBorderRadius = 10;
  static const double _buttonLandScapeWidth = 122;
  static late double _buttonWidth;
  
  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      SubmitButton._buttonWidth = SubmitButton._buttonLandScapeWidth;
    }
    else {
      SubmitButton._buttonWidth = double.infinity;
    }
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(SubmitButton._buttonElevation),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SubmitButton._buttonBorderRadius))
        ),
        minimumSize: MaterialStateProperty.all(
          Size(SubmitButton._buttonWidth, SubmitButton._buttonHeight)
        ),
      ),
      onPressed: FormFieldValues.isSubmitAllowed ? _submitForm : null,
      child: Text(appLocalizations.submitButtonText)
    );
  }

  void _submitForm() {
    showDialog<bool>(
      context: context,
      builder: (context) => alertDialogBox(context)
    ).then((action) {
      if (action!) {
        // TODO: Navigate to form response page, with form field values as argument
      }
    });
    widget.resetFormState();
  }
}
