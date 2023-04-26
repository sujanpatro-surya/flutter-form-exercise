import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/form_field_values.dart';
import 'package:flutter_form_exercise/screens/form/sections/build_layout.dart';
import 'package:flutter_form_exercise/theme/text_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../app_paddings.dart';

class BirthDateField extends StatefulWidget {
  const BirthDateField({Key? key, required this.onChanged}) : super(key: key);
  final ValueSetter<DateTime?> onChanged;

  static const int _firstBirthYearSupported = 1900;

  @override
  State<BirthDateField> createState() => _BirthDateFieldState();
}

class _BirthDateFieldState extends State<BirthDateField> {
  @override
  void initState() {
    FormFieldValues.dateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    FormFieldValues.dateController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final ThemeData theme = Theme.of(context);
    return buildLayout(
      fullWidth: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppPaddings.small),
            child: Text(appLocalizations.birthDateQuestion, style: theme.textTheme.bodyLarge),
          ),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.small),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: FormFieldValues.dateController,
              readOnly: true,
              style: textTheme.bodyMedium,
              validator: (date) {
                if (date == null) {
                  return appLocalizations.birthDateError;
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: appLocalizations.birthDAteFieldHint,
                suffixIcon: const Icon(Icons.calendar_today_outlined),
              ).applyDefaults(theme.inputDecorationTheme),
              onTap: () => showDatePicker(
                context: context,
                initialDate: FormFieldValues.birthDate ?? DateTime.now(),
                firstDate: DateTime(BirthDateField._firstBirthYearSupported),
                lastDate: DateTime.now()
              ).then(widget.onChanged),
            )
          ),
        ],
      )
    );
  }
}
