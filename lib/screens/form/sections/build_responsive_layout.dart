import 'package:flutter/material.dart';

import '../../app_paddings.dart';
import '../form_page_utils.dart';

LayoutBuilder buildResponsiveLayoutWithDynamicWidth({required Widget child, bool fullWidth=true}) {
  return LayoutBuilder(
    builder: (context, boxConstraints) {
      if (fullWidth || isScreenPortrait(context)) {
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
