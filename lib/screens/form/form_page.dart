import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/sections/birth_date_field.dart';
import 'package:flutter_form_exercise/screens/form/sections/gender_radio.dart';
import 'package:flutter_form_exercise/screens/form/sections/opinion_field.dart';
import 'package:flutter_form_exercise/screens/form/sections/origin_country_dropdown.dart';
import 'package:flutter_form_exercise/screens/form/sections/submit_button.dart';
import 'package:flutter_form_exercise/screens/form/sections/terms_and_conditions_checkbox.dart';
import 'package:flutter_form_exercise/screens/form/form_page_utils.dart';
import '../app_paddings.dart';
import 'form_field_values.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_exercise/screens/form/sections/name_field.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  static late double submitButtonWidth;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    late final List<Widget> formElementsOrder;
    if (isScreenPortrait(context)) {
      formElementsOrder = getWidgetListInPortraitOrder();
    } else {
      formElementsOrder = getWidgetListInLandscapeOrder();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations.appBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppPaddings.xlarge,
          AppPaddings.large,
          AppPaddings.xlarge,
          AppPaddings.xlarge
        ),
        child: Form(
          key: FormFieldValues.formKey,
          child: Wrap(
            runSpacing: AppPaddings.xlarge,
            alignment: WrapAlignment.center,
            spacing: AppPaddings.xlarge,
            children: formElementsOrder
          )
        )
      )
    );
  }

  List<Widget> getWidgetListInPortraitOrder() {
    return [
      NameField(onChanged: _onChangedName),
      BirthDateField(onChanged: _onChangedBirthDate),
      GenderRadio(onChanged: _onChangedGender),
      OpinionField(onChanged: _onChangedOpinion),
      OriginCountryDropDown(onChanged: _onChangedOpinion),
      TermsAndConditionsCheckBox(onChanged: onChangedTermsAndConditions, onTap: onTapTermsAndConditions),
      SubmitButton(resetFormState: _resetFormState)
    ];
  }

  List<Widget> getWidgetListInLandscapeOrder() {
    return [
      NameField(onChanged: _onChangedName),
      BirthDateField(onChanged: _onChangedBirthDate),
      GenderRadio(onChanged: _onChangedGender),
      OriginCountryDropDown(onChanged: _onChangedOrigin),
      OpinionField(onChanged: _onChangedOpinion),
      TermsAndConditionsCheckBox(onChanged: onChangedTermsAndConditions, onTap: onTapTermsAndConditions),
      SubmitButton(resetFormState: _resetFormState)
    ];
  }

  void _onChangedName(String value) {
    setState(() {
      FormFieldValues.name = value;
      updateSubmitButtonStatus();
    });
  }

  void _onChangedBirthDate(DateTime? value) {
    setState(() {
      FormFieldValues.dateController.text = _convertDateFormatInString(value!);
      FormFieldValues.birthDate = value;
      updateSubmitButtonStatus();
    });
  }

  void _onChangedGender(String? gender) {
    setState(() {
      FormFieldValues.gender = gender;
    });
  }

  void _onChangedOpinion(String? opinion) {
    setState(() {
      FormFieldValues.opinion = opinion;
    });
  }

  void _onChangedOrigin(String? country) {
    setState(() {
      FormFieldValues.originCountry = country;
    });
  }

  void onChangedTermsAndConditions(bool? state) {
    return setState(() {
      FormFieldValues.isTermsAndConditionsAccepted = state!;
      updateSubmitButtonStatus();
    });
  }

  void onTapTermsAndConditions() {
    return setState(() {
      FormFieldValues.isTermsAndConditionsAccepted = !FormFieldValues.isTermsAndConditionsAccepted;
      updateSubmitButtonStatus();
    });
  }

  void _resetFormState() {
    FormFieldValues.formKey.currentState!.reset();
    setState(() {
      FormFieldValues.name = null;
      FormFieldValues.dateController.text = '';
      FormFieldValues.birthDate = null;
      FormFieldValues.gender = null;
      FormFieldValues.originCountry = null;
      FormFieldValues.opinion = null;
      FormFieldValues.isTermsAndConditionsAccepted = false;
      FormFieldValues.isSubmitAllowed = false;
    });
  }
}

String _convertDateFormatInString(DateTime value) {
  return value
    .toString()
    .split(' ').first
    .split('-')
    .reversed
    .join('/');
}
