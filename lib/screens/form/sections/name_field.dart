import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_paddings.dart';
import '../form_page_utils.dart';

class NameField extends StatelessWidget {
  const NameField({Key? key, required this.onChanged}) : super(key: key);
  final ValueSetter<String> onChanged;

  static const int _minimumNameLength = 3;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return buildLayout(
      fullWidth: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFieldQuestionWithPadding(question: appLocalizations.nameQuestion),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.small),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              onChanged: onChanged,
            ),
          ),
        ],
      )
    );
  }
}
