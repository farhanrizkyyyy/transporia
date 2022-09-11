import 'package:flutter/material.dart';
import 'package:intransporia/widgets/skeletons/skeletons.dart';

class RegularSkeleton extends StatelessWidget {
  const RegularSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseSkeleton(
      width: MediaQuery.of(context).size.width / 3.8,
      height: 20.0,
    );
  }
}