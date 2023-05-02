import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/form_field_values.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_responsive_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_paddings.dart';

class TermsAndConditionsCheckBox extends StatelessWidget {
  const TermsAndConditionsCheckBox({
    Key? key,
    required ValueSetter<bool?> onChanged,
    required ValueGetter<void> onTap
  }) : _onChanged = onChanged, _onTap = onTap, super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return buildResponsiveLayoutWithDynamicWidth(
      child: Row(
        children: [
          SizedBox(
            height: _boxSize,
            width: _boxSize,
            child: Padding(
              padding: const EdgeInsets.all(_boxPadding),
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

  final ValueGetter<void> _onTap;
  final ValueSetter<bool?> _onChanged;
  static const double _boxSize = 24;
  static const double _boxPadding = 3;
}
