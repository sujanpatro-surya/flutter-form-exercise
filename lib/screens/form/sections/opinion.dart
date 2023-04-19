import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';

class OpinionField extends StatefulWidget {
  const OpinionField({Key? key}) : super(key: key);
  static const double _opinionTextBoxHeight = 100;
  static const int _opinionTextBoxMaxLines = 5;

  @override
  State<OpinionField> createState() => _OpinionFieldState();
}

class _OpinionFieldState extends State<OpinionField> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);

    return buildLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFieldQuestion(question: appLocalizations.opinionQuestion),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.small),
            child: SizedBox(
              height: OpinionField._opinionTextBoxHeight,
              child: TextFormField(
                style: theme.textTheme.bodyMedium,
                maxLines: OpinionField._opinionTextBoxMaxLines,
                decoration: InputDecoration(
                  hintText: appLocalizations.opinionFieldHint
                ).applyDefaults(theme.inputDecorationTheme),
                onChanged: (value) {
                  setState(() {
                    FormFieldValues.opinion = value;
                  });
                }
              ),
            ),
          ),
        ],
      )
    );
  }
}
