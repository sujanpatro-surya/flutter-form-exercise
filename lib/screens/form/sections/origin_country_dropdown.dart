import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/form_field_values.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_paddings.dart';
import '../form_page_utils.dart';

class OriginCountryDropDown extends StatelessWidget {
  const OriginCountryDropDown({
    Key? key,
    required ValueSetter<String?> onChanged
  }) : _onChanged = onChanged, super(key: key);
  final ValueSetter<String?> _onChanged;
  
  static late List<String> _dropDownCountryItems;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    OriginCountryDropDown._dropDownCountryItems = [
      appLocalizations.indiaDropDownItem,
      appLocalizations.usaDropDownItem,
      appLocalizations.russiaDropDownItem,
      appLocalizations.chinaDropDownItem,
      appLocalizations.japanDropDownItem,
    ];

    return buildLayout(
      fullWidth: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFieldQuestionWithPadding(question: appLocalizations.originCountryQuestion),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.small),
            child: DropdownButtonFormField(
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.hint),
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: appLocalizations.originCountryDropdownHint,
              ).applyDefaults(theme.inputDecorationTheme),
              value: FormFieldValues.originCountry,
              items: _dropDownCountryItems.map(
                (country) => DropdownMenuItem(
                  value: country,
                  child: Text(country),
                )
              ).toList(),
              onChanged: _onChanged,
            )
          )
        ]
      )
    );
  }
}