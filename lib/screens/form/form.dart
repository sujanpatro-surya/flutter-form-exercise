import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/common_util.dart';
import 'package:flutter_form_exercise/screens/form/sections/birth_date.dart';
import 'package:flutter_form_exercise/screens/form/sections/gender.dart';
import 'package:flutter_form_exercise/screens/form/sections/opinion.dart';
import 'package:flutter_form_exercise/screens/form/sections/origin_country.dart';
import 'package:flutter_form_exercise/screens/form/sections/submit.dart';
import 'package:flutter_form_exercise/screens/form/sections/terms_and_conditions.dart';
import 'common_values.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_exercise/screens/form/sections/name.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);
  static late double submitButtonWidth;
  static const double _appBarTitleBottomPadding = 12;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    late final Widget appBarText;
    late final List<Widget> formElementsOrder;
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      formElementsOrder = getWidgetListInPortraitOrder();
      appBarText = Text(appLocalizations.appBarTitle);
    }
    else {
      formElementsOrder = getWidgetListInLandscapeOrder();
      appBarText = Padding(padding: const EdgeInsets.fromLTRB(
          AppPaddings.large,
          AppPaddings.large,
          AppPaddings.large,
          FormPage._appBarTitleBottomPadding,
        ),
        child: Text(appLocalizations.appBarTitle),
      );
    }

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: appBarText
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
          ),
        ),
      ),
    );
  }

  List<Widget> getWidgetListInPortraitOrder() {
    return [
      NameField(onChanged: onChangedName),
      BirthDateField(onChanged: onChangedBirthDate),
      const GenderRadio(),
      const OpinionField(),
      const OriginCountryDropDown(),
      TAndCCheckBox(onChanged: onChangedTAndC, onTap: onTapTAndC),
      SubmitButton(resetFormState: _resetFormState)
    ];
  }

  List<Widget> getWidgetListInLandscapeOrder() {
    return [
      NameField(onChanged: onChangedName),
      BirthDateField(onChanged: onChangedBirthDate),
      const GenderRadio(),
      const OriginCountryDropDown(),
      const OpinionField(),
      TAndCCheckBox(onChanged: onChangedTAndC, onTap: onTapTAndC),
      SubmitButton(resetFormState: _resetFormState)
    ];
  }

  void onChangedName(String value) {
    setState(() {
      FormFieldValues.name = value;
      updateSubmitButtonStatus();
    });
  }

  void onChangedBirthDate(DateTime? value) {
    setState(() {
      FormFieldValues.dateController.text = _convertDateFormatInString(value!);
      FormFieldValues.birthDate = value;
      updateSubmitButtonStatus();
    });
  }

  void onChangedTAndC(bool? state) {
    return setState(() {
      FormFieldValues.isTermsAndConditionsAccepted = state!;
      updateSubmitButtonStatus();
    });
  }

  void onTapTAndC() {
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
