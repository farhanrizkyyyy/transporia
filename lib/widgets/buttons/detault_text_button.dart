import 'package:flutter/material.dart';
import 'package:intransporia/theme/theme.dart';

class DefaultTextButton extends StatelessWidget {
  final void Function() onPressed;
  final String title;

  const DefaultTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: Theme.of(context).textButtonTheme.style,
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Constants.dark
            ),
      ),
    );
  }
}
