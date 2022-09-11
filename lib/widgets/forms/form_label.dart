import 'package:flutter/material.dart';
import 'package:intransporia/theme/theme.dart';

class FormLabel extends StatelessWidget {
  final String labelText;

  const FormLabel({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$labelText ',
        style: Theme.of(context).inputDecorationTheme.labelStyle,
        children: const [
          TextSpan(
            text: '*',
            style: TextStyle(color: Constants.red),
          ),
        ],
      ),
    );
  }
}
