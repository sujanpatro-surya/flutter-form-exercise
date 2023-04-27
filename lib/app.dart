import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'on_generate_routes.dart';

class FormApp extends StatelessWidget {
  const FormApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: themeLight,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: GenerateRoute.generateRoute,
    );
  }
}
