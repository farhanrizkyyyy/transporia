// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/screens/belanjain/belanjain_history_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_home_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_order_screen.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainBaseScreen extends StatefulWidget {
  const BelanjainBaseScreen({super.key});

  @override
  State<BelanjainBaseScreen> createState() => _BelanjainBaseScreenState();
}

class _BelanjainBaseScreenState extends State<BelanjainBaseScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    BelanjainHomeScreen(),
    BelanjainOrderScreen(),
    BelanjainHistoryScreen()
  ];

  final List<String> appbarTitles = ['Belanjain', 'Pesanan', 'Riwayat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      backgroundColor: Color(0xFFFBFAFF),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  AppBar _buildAppbar() {
    return BelanjainAppbar(
      context: context,
      title: Text(
        appbarTitles[_selectedIndex],
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: _selectedIndex == 0 ? 18 : null,
        ),
      ),
      actions: [
        _selectedIndex == 0 ? _buildCartButton() : Container(),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildCartButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/belanjain/cart');
      },
      child: Center(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.orange2,
              ),
              child: Transform.scale(
                scale: 1.2,
                child: SvgPicture.asset(IntransporiaImages.shoppingCart),
              ),
            ),
            Positioned(
              top: 2.5,
              right: 2,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavbar() {
    final List<String> navbarIcons = [
      IntransporiaImages.navbarHome,
      IntransporiaImages.navbarOrder,
      IntransporiaImages.navbarHistory
    ];

    final List<String> navbarActiveIcons = [
      IntransporiaImages.navbarHomeActive,
      IntransporiaImages.navbarOrderActive,
      IntransporiaImages.navbarHistoryActive
    ];

    final List<String> navbarLabels = ['Beranda', 'Pesanan', 'Riwayat'];

    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: onIndexChanged,
      items: List.generate(navbarIcons.length, (index) {
        return BottomNavigationBarItem(
          icon: Container(
            padding: index == 0
                ? EdgeInsets.zero
                : EdgeInsets.symmetric(vertical: 2),
            child: index == _selectedIndex
                ? Padding(
                    padding: index == 1
                        ? EdgeInsets.zero
                        : index == 2
                            ? EdgeInsets.only(bottom: 1)
                            : EdgeInsets.symmetric(vertical: 2),
                    child: SvgPicture.asset(navbarActiveIcons[index]),
                  )
                : SvgPicture.asset(navbarIcons[index]),
          ),
          label: navbarLabels[index],
        );
      }),
      selectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: Constants.orange2,
      ),
      selectedItemColor: Constants.orange2,
      selectedIconTheme: IconThemeData(
        color: Constants.orange2,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: Constants.orange2,
      ),
    );
  }

  void onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
