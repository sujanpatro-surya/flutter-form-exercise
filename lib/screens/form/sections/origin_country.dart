import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OriginCountryDropDown extends StatefulWidget {
  const OriginCountryDropDown({Key? key}) : super(key: key);
  static late List<String> _dropDownCountryItems;

  @override
  State<OriginCountryDropDown> createState() => _OriginCountryDropDownState();
}

class _OriginCountryDropDownState extends State<OriginCountryDropDown> {
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
          buildFieldQuestion(question: appLocalizations.originCountryQuestion),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.small),
            child: DropdownButtonFormField(
              icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AllAppColors.hint),
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: appLocalizations.originCountryDropdownHint,
              ).applyDefaults(theme.inputDecorationTheme),
              value: FormFieldValues.originCountry,
              items: OriginCountryDropDown._dropDownCountryItems.map(
                (country) => DropdownMenuItem(
                  value: country,
                  child: Text(country),
                )
              ).toList(),
              onChanged: (country) {
                setState(() {
                  FormFieldValues.originCountry = country;
                });
              },
            )
          ),
        ],
      )
    );
  }
}
