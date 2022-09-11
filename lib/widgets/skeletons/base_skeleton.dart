import 'package:flutter/material.dart';
import 'package:intransporia/theme/theme.dart';

class BaseSkeleton extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? margin;

  const BaseSkeleton(
      {super.key, this.height, this.width, this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Constants.borderBase.withOpacity(0.1),
            Constants.borderBase2.withOpacity(0.1),
          ],
          stops: const [0.1, 0.3],
          begin: const Alignment(-1.0, -0.3),
          end: const Alignment(1.0, 0.3),
          tileMode: TileMode.clamp,
        ),
      ),
      child: child,
    );
  }
}
