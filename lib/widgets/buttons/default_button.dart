import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  final String label;
  final EdgeInsetsGeometry? padding;

  const DefaultButton({
    Key? key,
    required this.onPressed,
    this.buttonStyle,
    required this.label,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: buttonStyle,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                letterSpacing: 0.4,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
