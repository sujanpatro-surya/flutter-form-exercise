import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../user_opinion.dart';
import '../common_util.dart';

class FormResponse extends StatelessWidget {
  const FormResponse({Key? key}) : super(key: key);
  static const double _buttonElevation = 0;
  static const double _buttonBorderRadius = 10;
  static const double _buttonTextVerticalPadding = 10;
  static const double _buttonTextHorizontalPadding = 20;

  @override
  Widget build(BuildContext context) {
    final UserOpinion userOpinion = ModalRoute.of(context)!.settings.arguments as UserOpinion;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: Text(
          appLocalizations.yourResponse,
          style: theme.textTheme.headlineSmall,
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppPaddings.xlarge,
                  AppPaddings.large,
                  AppPaddings.xlarge,
                  AppPaddings.xlarge
                ),
                child: Wrap(
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.center,
                  runSpacing: AppPaddings.large,
                  children: responseFields(appLocalizations, userOpinion, theme.textTheme),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(AppPaddings.xlarge, AppPaddings.large, AppPaddings.xlarge, AppPaddings.large),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
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
              onPressed: () => Navigator.pop(context),
              child: Text(appLocalizations.goBackButtonText)
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> responseFields(AppLocalizations appLocalizations, UserOpinion userOpinion, TextTheme theme) {
    final List<List<String?>> responses = [
      [appLocalizations.nameQuestion, userOpinion.name],
      [appLocalizations.birthDateQuestion, userOpinion.birthDate],
      [appLocalizations.genderQuestion, userOpinion.gender],
      [appLocalizations.originCountryQuestion, userOpinion.originCountry],
      [appLocalizations.opinionQuestion, userOpinion.opinion]
    ];
    return responses.map((field) {
      return buildSection(field.first!, field.last, theme);
    }).toList();
    /*return [
      buildSection(
        appLocalizations.nameQuestion,
        userOpinion.name,
        theme
      ),
      buildSection(
        appLocalizations.birthDateQuestion,
        userOpinion.birthDate,
        theme
      ),
      buildSection(
        appLocalizations.genderQuestion,
        userOpinion.gender,
        theme
      ),
      buildSection(
        appLocalizations.originCountryQuestion,
        userOpinion.originCountry,
        theme
      ),
      buildSection(
        appLocalizations.opinionQuestion,
        userOpinion.opinion,
        theme
      ),
    ];*/
  }
}

Column buildSection(String field, String? value, TextTheme theme) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: AppPaddings.xsmall),
          child: Text(
            field,
            style: theme.bodyMedium!.copyWith(color: AllAppColors.hint),
          ),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: AppPaddings.xsmall),
          child: Text(
            value ?? '',
            style: theme.bodyLarge
          )
        ),
      ),
    ],
  );
}
