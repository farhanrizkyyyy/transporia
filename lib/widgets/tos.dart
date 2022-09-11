import 'package:flutter/material.dart';
import 'package:intransporia/theme/theme.dart';

class Tos extends StatelessWidget {
  const Tos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double fontSize = 11.0;
    const TextStyle borderStyle = TextStyle(
      color: Constants.borderBase2,
      fontSize: fontSize,
    );
    const TextStyle inkStyle = TextStyle(
      color: Constants.ink,
      fontSize: fontSize,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 42.0),
      child: RichText(
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        text: const TextSpan(
          text: 'Dengan masuk atau mendaftar, Anda menyetujui ',
          style: borderStyle,
          children: [
            TextSpan(
              text: 'Persyaratan Layanan ',
              style: inkStyle,
            ),
            TextSpan(
              text: 'dan ',
              style: borderStyle,
            ),
            TextSpan(
              text: 'Kebijakan Privasi ',
              style: inkStyle,
            ),
            TextSpan(
              text: 'kami.',
              style: borderStyle,
            ),
          ],
        ),
      ),
    );
  }
}
