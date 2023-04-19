import 'package:flutter/cupertino.dart';
import '../../theme/text_theme.dart';

class FormFieldValues {
  static String? name;
  static DateTime? birthDate;
  static String? gender;
  static String? originCountry;
  static String? opinion;
  static bool isTermsAndConditionsAccepted = false;
  static bool isSubmitAllowed = false;

  static late final TextEditingController dateController;

  static final GlobalKey<FormState> formKey = GlobalKey();
}

class AppPaddings {
  static const double xlarge = 32;
  static const double large = 16;
  static const double medium = 8;
  static const double small = 4;
  static const double xsmall = 2;
}

Padding buildFieldQuestion({required String question}) {
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
