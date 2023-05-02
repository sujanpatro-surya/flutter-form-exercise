import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_responsive_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_paddings.dart';
import '../form_page_utils.dart';

class NameField extends StatelessWidget {
  const NameField({
    Key? key,
    required ValueSetter<String> onChanged
  }) : _onChanged = onChanged, super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return buildResponsiveLayoutWithDynamicWidth(
      fullWidth: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFieldQuestionWithPadding(question: appLocalizations.nameQuestion),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.small),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textCapitalization: TextCapitalization.words,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                hintText: appLocalizations.nameFieldHint,
              ).applyDefaults(theme.inputDecorationTheme),
              validator: (value) {
                if (value!.trim().length < _minimumNameLength) {
                  return appLocalizations.nameError;
                }
                return null;
              },
              onChanged: _onChanged,
            ),
          ),
        ],
      )
    );
  }

  final ValueSetter<String> _onChanged;
  static const int _minimumNameLength = 3;
}
