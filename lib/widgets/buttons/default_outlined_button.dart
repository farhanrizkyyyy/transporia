import 'package:flutter/material.dart';
import 'package:intransporia/theme/theme.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final void Function() onPressed;
  final Widget icon;
  final String label;
  final bool isLoading;

  const DefaultOutlinedButton({
    Key? key,
    required this.padding,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: Center(
          child: isLoading == false
              ? Text(
                  label,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        letterSpacing: 0.4,
                        fontWeight: FontWeight.w500,
                        color: Constants.dark,
                      ),
                )
              : CircularProgressIndicator(
                  color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
