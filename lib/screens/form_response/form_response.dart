import 'package:flutter/material.dart';
import 'package:flutter_form_exercise/screens/form/common_values.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../user_opinion.dart';
import '../common_util.dart';

class FormResponse extends StatelessWidget {
  const FormResponse({Key? key}) : super(key: key);
  static const double _submitButtonLandscapeWidth = 99;
  static late double _submitButtonWidth;

  @override
  Widget build(BuildContext context) {
    final UserOpinion userOpinion = ModalRoute.of(context)!.settings.arguments as UserOpinion;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    
    if (MediaQuery.of(context).orientation == Orientation.portrait){
      _submitButtonWidth = double.infinity;
    }
    // else {
    //   _submitButtonWidth = _submitButtonLandscapeWidth;
    // }

    return Scaffold(
      appBar: buildAppBar(
        context: context,
        title: Text(
          appLocalizations.yourResponse,
          // style: const TextStyle(color: Color(0xFF36383A))
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppPaddings.xlarge,
                  AppPaddings.large,
                  AppPaddings.xlarge,
                  AppPaddings.xlarge
                ),
                child: Wrap(
                  runAlignment: WrapAlignment.start,
                  alignment: WrapAlignment.center,
                  runSpacing: AppPaddings.large,
                  children: responseFields(appLocalizations, userOpinion),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(AppPaddings.xlarge, AppPaddings.large, AppPaddings.xlarge, AppPaddings.large),
            child: ElevatedButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(0),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
                fixedSize: MaterialStateProperty.all(
                  Size(_submitButtonWidth, 40)
                ),
              ),
              onPressed: () => Navigator.pop(context),
              child: Text(appLocalizations.goBackButtonText)
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> responseFields(AppLocalizations appLocalizations, UserOpinion userOpinion) {
    return [
      buildSection(
        appLocalizations.nameQuestion,
        userOpinion.name
      ),
      buildSection(
        appLocalizations.birthDateQuestion,
        userOpinion.birthDate
      ),
      buildSection(
        appLocalizations.genderQuestion,
        userOpinion.gender
      ),
      buildSection(
        appLocalizations.originCountryQuestion,
        userOpinion.originCountry
      ),
      buildSection(
        appLocalizations.opinionQuestion,
        userOpinion.opinion
      ),
    ];
  }
}

Column buildSection(String field, String? value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            field,
            style: const TextStyle(
              fontSize: 14,
              letterSpacing: 0.22,
              // color: Color(0xFF8A8A8E)
            ),
          ),
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            value ?? '',
            style: const TextStyle(
              fontSize: 16,
              letterSpacing: 0.2,
              // color: Color(0xFF36383A)
            )
          )
        ),
      ),
    ],
  );
}
