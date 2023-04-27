import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_exercise/screens/form/form_field_values.dart';

import '../../app_paddings.dart';
import '../form_page_utils.dart';

class GenderRadio extends StatelessWidget {
  const GenderRadio({
    Key? key,
    required ValueSetter<String?> onChanged
  }) : _onChanged = onChanged, super(key: key);
  final ValueSetter<String?> _onChanged;

  static const double _radioButtonSize = 24;
  static const double _radioTileTextSize = 78;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    return buildLayout(
      fullWidth: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFieldQuestionWithPadding(question: appLocalizations.genderQuestion),
          _buildGenderRadioTile(theme: theme, genderValue: appLocalizations.male, onChanged: _onChanged),
          _buildGenderRadioTile(theme: theme, genderValue: appLocalizations.female, onChanged: _onChanged),
          _buildGenderRadioTile(theme: theme, genderValue: appLocalizations.otherGender, onChanged: _onChanged)
        ],
      )
    );
  }
}

Padding _buildGenderRadioTile({required ThemeData theme, required String genderValue, required ValueSetter<String?> onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: AppPaddings.small),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildRadioButton(genderValue, onChanged),
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

SizedBox _buildRadioButton(String genderValue, ValueSetter<String?> onChanged) {
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
