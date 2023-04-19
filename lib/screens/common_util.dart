import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';

PreferredSizeWidget buildAppBar({
  required BuildContext context,
  required Widget title,
  bool isResponsePage = false
}) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return customAppBar(title);
  }
  else {
    return AppBar(
      title: title,
      automaticallyImplyLeading: false,
    );
  }
}

PreferredSizeWidget customAppBar(Widget title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(_appBarHeight),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(
        AppPaddings.xlarge,
        AppPaddings.xlarge,
        AppPaddings.xlarge,
        AppPaddings.large,
      ),
      child: AppBar(
        titleSpacing: _appBarTitleSpacing,
        primary: false,
        title: title,
        automaticallyImplyLeading: false,
        elevation: _appBarElevation
      ),
    )
  );
}

Size getButtonSize(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return const Size(_defaultButtonSize, _defaultButtonSize);
  }
  else {
    return const Size(double.infinity, _defaultButtonSize);
  }
}

const double _appBarHeight = 56;
const double _appBarTitleSpacing = 0;
const double _appBarElevation = 0;
const double _defaultButtonSize = 0;
