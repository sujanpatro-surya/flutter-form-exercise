import 'package:flutter/cupertino.dart';

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
