import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';

PreferredSizeWidget buildAppBar({
  required BuildContext context,
  required Text title,
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

PreferredSizeWidget customAppBar(Text title) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 56),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(
        AppPaddings.xlarge,
        AppPaddings.xlarge,
        AppPaddings.xlarge,
        AppPaddings.large,
      ),
      child: AppBar(
        primary: false,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppPaddings.large,
            AppPaddings.large,
            AppPaddings.large,
            _appBarTitleBottomPadding,
          ),
          child: title
        ),
        automaticallyImplyLeading: false,
        elevation: 0
      ),
    )
  );
}

const double _appBarTitleBottomPadding = 12;

