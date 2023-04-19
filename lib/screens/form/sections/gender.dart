import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';

class GenderRadio extends StatefulWidget {
  const GenderRadio({Key? key}) : super(key: key);
  static const double _radioButtonSize = 24;
  static const double _radioTileTextSize = 78;

  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    return buildLayout(
      fullWidth: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFieldQuestion(question: appLocalizations.genderQuestion),
          buildGenderRadioTile(theme: theme, genderValue: appLocalizations.male),
          buildGenderRadioTile(theme: theme, genderValue: appLocalizations.female),
          buildGenderRadioTile(theme: theme, genderValue: appLocalizations.otherGender)
        ],
      )
    );
  }

  Padding buildGenderRadioTile({required ThemeData theme, required String genderValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPaddings.small),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          buildRadioButton(genderValue),
          InkWell(
            onTap: () => onChanged(genderValue),
            child: SizedBox(
              width: GenderRadio._radioTileTextSize,
              child: Padding(
                padding: const EdgeInsets.only(left: AppPaddings.medium),
                child: Text(genderValue, style: theme.textTheme.bodyMedium),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildRadioButton(String genderValue) {
    return SizedBox(
      height: GenderRadio._radioButtonSize,
      width: GenderRadio._radioButtonSize,
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.xsmall),
        child: Radio<String>(
          value: genderValue,
          groupValue: FormFieldValues.gender,
          onChanged: onChanged
        ),
      ),
    );
  }

  void onChanged(String? gender) => setState(() => FormFieldValues.gender = gender);
}
