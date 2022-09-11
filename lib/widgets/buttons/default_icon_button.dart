import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double? iconSize;
  final Widget icon;

  const DefaultIconButton({
    Key? key,
    required this.onPressed,
    this.iconSize,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      iconSize: iconSize ?? 24.0,
      onPressed: onPressed,
      icon: icon,
    );
  }
}
