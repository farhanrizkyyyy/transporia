// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

AppBar BelanjainAppbar({
  required BuildContext context,
  Widget? leading,
  required Widget title,
  List<Widget>? actions,
  double? titleSpacing,
  bool backButton = true,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Color(0xFFFBFAFF),
    elevation: .8,
    leading: backButton
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            splashRadius: 20,
            icon: Icon(Icons.close),
          )
        : leading,
    title: title,
    titleSpacing: backButton ? 0 : null,
    actions: actions,
  );
}
