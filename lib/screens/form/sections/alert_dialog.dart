import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';
import 'package:flutter_form_exercise/theme/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AlertDialog alertDialogBox(BuildContext context) {
  final AppLocalizations appLocalisations = AppLocalizations.of(context)!;
  final ThemeData theme = Theme.of(context);
  const double dividerHeight = 0;
  const double buttonPadding = 12;
  return AlertDialog(
    backgroundColor: Colors.white,
    insetPadding: const EdgeInsets.symmetric(horizontal: 30),
    contentPadding: const EdgeInsets.all(20),
    actionsPadding: EdgeInsets.zero,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    content: SizedBox(width: double.infinity, child: Text(appLocalisations.alertDialogContent)),

    contentTextStyle: theme.textTheme.bodyMedium,
    actions: [
      const Divider(
        color: AppColors.divider,
        height: dividerHeight
      ),
      Padding(
        padding: const EdgeInsets.only(right: AppPaddings.medium),
        child: ButtonBar(
          buttonPadding: const EdgeInsets.all(buttonPadding),
          children: [
            ElevatedButton(
              style: _dialogButtonStyle,
              onPressed: () => Navigator.pop(context, false),
              child: Text(appLocalisations.closeButtonText, style: theme.textTheme.labelMedium),
            ),
            ElevatedButton(
              style: _dialogButtonStyle,
              onPressed: () => Navigator.pop(context, true),
              child: Text(appLocalisations.viewResponseButtonText, style: theme.textTheme.labelMedium)
            ),
          ],
        ),
      ),
    ],
  );
}

ButtonStyle _dialogButtonStyle = ElevatedButton.styleFrom(
  padding: const EdgeInsets.symmetric(
    vertical: AppPaddings.medium,
    horizontal: AppPaddings.large
  ),
  elevation: _dialogButtonElevation,
  backgroundColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(_dialogButtonBorderRadius),
    side: const BorderSide(color: AppColors.outline)
  )
);

const double _dialogButtonElevation = 1;
const double _dialogButtonBorderRadius = 8;
