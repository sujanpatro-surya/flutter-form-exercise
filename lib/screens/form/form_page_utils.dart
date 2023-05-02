import 'package:flutter/material.dart';
import '../../theme/text_theme.dart';
import '../app_paddings.dart';
import 'form_field_values.dart';

Padding buildFieldQuestionWithPadding({required String question}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: AppPaddings.small),
    child: Text(question, style: textTheme.bodyLarge),
  );
}

void updateSubmitButtonStatus() {
  FormFieldValues.isSubmitAllowed =
    FormFieldValues.formKey.currentState!.validate() &&
    FormFieldValues.isTermsAndConditionsAccepted &&
    FormFieldValues.dateController.text.isNotEmpty;
}

bool isScreenPortrait(BuildContext context) =>
  MediaQuery.of(context).orientation == Orientation.portrait;
