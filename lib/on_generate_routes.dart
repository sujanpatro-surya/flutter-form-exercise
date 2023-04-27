import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/errors.dart';
import 'package:flutter_form_exercise/screens/form/form_page.dart';

class GenerateRoute {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/') : {
        return MaterialPageRoute(
          builder: (context) => const FormPage(),
          settings: settings
        );
      }
      default: throw RouteNotFoundError();
    }
  }
}
