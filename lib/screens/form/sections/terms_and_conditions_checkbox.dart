import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/form_field_values.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_paddings.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    Key? key,
    required ValueSetter<bool?> onChanged,
    required ValueGetter<void> onTap
  }) : _onChanged = onChanged, _onTap = onTap, super(key: key);
  final ValueGetter<void> _onTap;
  final ValueSetter<bool?> _onChanged;
  
  static const double _checkboxSize = 24;
  static const double _checkboxPadding = 3;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return buildLayout(
      child: Row(
        children: [
          SizedBox(
            height: _checkboxSize,
            width: _checkboxSize,
            child: Padding(
              padding: const EdgeInsets.all(_checkboxPadding),
              child: Checkbox(
                value: FormFieldValues.isTermsAndConditionsAccepted,
                onChanged: _onChanged
              ),
            ),
          ),
          InkWell(
            onTap: _onTap,
            child: Padding(
              padding: const EdgeInsets.only(left: AppPaddings.medium),
              child: Text(appLocalizations.termsAndConditionsText, style: theme.textTheme.bodyMedium),
            ),
          ),
        ]
      )
    );
  }
}
