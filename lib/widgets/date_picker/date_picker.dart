import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intransporia/widgets/widgets.dart';

void showAppDatePicker(
  BuildContext context, {
  required void Function(DateTime) onDateTimeChanged,
  required VoidCallback buttonPressed,
  DateTime? initialDate,
}) {
  var size = MediaQuery.of(context).size;

  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    constraints: BoxConstraints.expand(height: size.height / 2.2),
    builder: (_) {
      return Container(
        margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height / 3,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                minimumDate: DateTime(1900),
                maximumDate: DateTime(2099),
                initialDateTime: initialDate ?? DateTime.now(),
                onDateTimeChanged: onDateTimeChanged,
              ),
            ),
            Center(
              child: DefaultButton(
                onPressed: buttonPressed,
                padding: const EdgeInsets.all(8.0),
                label: 'Pilih',
                buttonStyle:
                    Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          minimumSize: const MaterialStatePropertyAll(
                            Size(140.0, 38.0),
                          ),
                        ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
