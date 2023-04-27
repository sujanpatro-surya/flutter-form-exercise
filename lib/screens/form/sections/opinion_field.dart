import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';

import '../../app_paddings.dart';
import '../form_page_utils.dart';

class OpinionField extends StatelessWidget {
  const OpinionField({
    Key? key,
    required ValueSetter<String?> onChanged
  }) : _onChanged = onChanged, super(key: key);
  final ValueSetter<String?> _onChanged;
  
  static const double _opinionTextBoxHeight = 100;
  static const int _opinionTextBoxMaxLines = 5;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    return buildLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFieldQuestionWithPadding(question: appLocalizations.opinionQuestion),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.small),
            child: SizedBox(
              height: _opinionTextBoxHeight,
              child: TextFormField(
                textCapitalization: TextCapitalization.sentences,
                style: theme.textTheme.bodyMedium,
                maxLines: _opinionTextBoxMaxLines,
                decoration: InputDecoration(
                  hintText: appLocalizations.opinionFieldHint
                ).applyDefaults(theme.inputDecorationTheme),
                onChanged: _onChanged
              ),
            ),
          ),
        ],
      )
    );
  }
}
