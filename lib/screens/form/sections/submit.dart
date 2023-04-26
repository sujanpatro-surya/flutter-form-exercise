import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'alert_dialog.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key, required this.resetFormState}) : super(key: key);
  final ValueGetter<void> resetFormState;

  static const double _buttonElevation = 0;
  static const double _buttonBorderRadius = 10;
  static const double _buttonTextVerticalPadding = 10;
  static const double _buttonTextHorizontalPadding = 35.5;
  
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColors.disabled,
        disabledForegroundColor: AppColors.hint,
        padding: const EdgeInsets.symmetric(
          vertical: _buttonTextVerticalPadding,
          horizontal: _buttonTextHorizontalPadding
        ),
        elevation: _buttonElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_buttonBorderRadius)
        ),
        minimumSize: getButtonSize(context)
      ),
      onPressed: FormFieldValues.isSubmitAllowed ? () => _submitForm(context) : null,
      child: Text(appLocalizations.submitButtonText)
    );
  }

  Size getButtonSize(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return const Size(0, 0);
    }
    else {
      return const Size(double.infinity, 0);
    }
  }

  void _submitForm(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => alertDialogBox(context)
    ).then((action) {
      if (action!) {
        // TODO: Navigate to form response page, with form field values as argument
      }
    });
    resetFormState();
  }
}
