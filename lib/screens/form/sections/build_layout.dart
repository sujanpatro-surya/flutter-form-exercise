import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';

LayoutBuilder buildLayout({required Widget child, bool fullWidth=true}) {
  return LayoutBuilder(
    builder: (context, boxConstraints) {
      Orientation orientation = MediaQuery.of(context).orientation;
      if (fullWidth || orientation == Orientation.portrait) {
        return SizedBox(width: boxConstraints.maxWidth, child: child);
      }
      else {
        return SizedBox(
          width: boxConstraints.maxWidth/2 - AppPaddings.large,
          child: child,
        );
      }
    }
  );
}
