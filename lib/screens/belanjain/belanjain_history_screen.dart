// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/theme/constants.dart';

class BelanjainHistoryScreen extends StatefulWidget {
  const BelanjainHistoryScreen({super.key});

  @override
  State<BelanjainHistoryScreen> createState() => _BelanjainHistoryScreenState();
}

class _BelanjainHistoryScreenState extends State<BelanjainHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return _buildItem(
          stasiunName: 'Gambir',
          productName:
              'Paprika kuning  1 Kg, Driscolls Blueberry, testtesttest',
          dateTime: '15 juli  02:00',
        );
      },
      separatorBuilder: (context, index) => Container(),
      itemCount: 1,
    );
  }

  Widget _buildItem({
    required String stasiunName,
    required String productName,
    required String dateTime,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Constants.borderBase.withOpacity(.5),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SvgPicture.asset(IntransporiaImages.navbarHomeActive),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stasiunName,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      color: Constants.ink3,
                    ),
                  ),
                  Text(
                    dateTime,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: Constants.ink2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
