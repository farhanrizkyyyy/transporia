// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';

class BelanjainCourierHomeScreen extends StatefulWidget {
  const BelanjainCourierHomeScreen({super.key});

  @override
  State<BelanjainCourierHomeScreen> createState() =>
      BelanjainCourierHomeScreenState();
}

class BelanjainCourierHomeScreenState
    extends State<BelanjainCourierHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(IntransporiaImages.courierShoppingBag),
          SizedBox(height: 24),
          Text(
            'Belum ada pesanan masuk',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7680A6),
            ),
          ),
        ],
      ),
    );
  }
}
