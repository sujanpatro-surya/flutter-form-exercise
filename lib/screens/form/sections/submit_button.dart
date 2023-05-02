import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/form_field_values.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../form_page_utils.dart';
import 'alert_dialog.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required ValueGetter<void> resetFormState
  }) : _resetFormState = resetFormState, super(key: key);
  
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
        minimumSize: _getButtonSize(context)
      ),
      onPressed: FormFieldValues.isSubmitAllowed ? () => _submitForm(context) : null,
      child: Text(appLocalizations.submitButtonText)
    );
  }

  void _submitForm(BuildContext context) {
    showDialog<bool>(
      context: context,
      builder: (context) => alertDialogBox(context)
    ).then((action) {});

    _resetFormState();
  }

  final ValueGetter<void> _resetFormState;
  static const double _buttonElevation = 0;
  static const double _buttonBorderRadius = 10;
  static const double _buttonTextVerticalPadding = 10;
  static const double _buttonTextHorizontalPadding = 35.5;
}

Size _getButtonSize(BuildContext context) {
  if (isScreenPortrait(context)) {
    return const Size(double.infinity, 0);
  } else {
    return const Size(0, 0);
  }
}
