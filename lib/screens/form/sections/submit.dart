import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../user_opinion.dart';
import '../../common_util.dart';
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
        disabledBackgroundColor: AllAppColors.disabled,
        disabledForegroundColor: AllAppColors.hint,
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

  void _submitForm(BuildContext context) {
    UserOpinion userOpinion = _getUserOpinionInstance();
    showDialog<bool>(
      context: context,
      builder: (context) => alertDialogBox(context)
    ).then((action) {
      if (action!) {
        Navigator.pushNamed(context, '/formResponse', arguments: userOpinion);
      }
    });
    resetFormState();
  }
}

UserOpinion _getUserOpinionInstance() {
  return UserOpinion(
    FormFieldValues.name!,
    FormFieldValues.dateController.text,
    FormFieldValues.gender,
    FormFieldValues.originCountry,
    FormFieldValues.opinion
  );
}
