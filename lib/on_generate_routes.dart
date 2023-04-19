import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/form.dart';
import 'package:flutter_form_exercise/screens/form_response/form_response.dart';

class GenerateRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/') : {
        return MaterialPageRoute(
          builder: (context) => const FormPage(),
          settings: settings
        );
      }

      case ('/formResponse') : {
        return MaterialPageRoute(
          builder: (context) => const FormResponse(),
          settings: settings
        );
      }
    }

    return null;
  }
}
