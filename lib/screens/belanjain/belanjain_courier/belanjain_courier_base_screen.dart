// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/screens/belanjain/belanjain_courier/belanjain_courier_history_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_courier/belanjain_courier_home_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_courier/belanjain_courier_order_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_courier/belanjain_courier_setting_screen.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainCourierBaseScreen extends StatefulWidget {
  const BelanjainCourierBaseScreen({super.key});

  @override
  State<BelanjainCourierBaseScreen> createState() =>
      _BelanjainCourierBaseScreenState();
}

class _BelanjainCourierBaseScreenState
    extends State<BelanjainCourierBaseScreen> {
  int _selectedIndex = 0;

  final List<String> _appbarTitles = [
    'Kurir Belanja Gambir',
    'Pesanan',
    'Riwayat',
    'Pengaturan'
  ];

  final List<Widget> _pages = [
    BelanjainCourierHomeScreen(),
    BelanjainCourierOrderScreen(),
    BelanjainCourierHistoryScreen(),
    BelanjainCourierSettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      appBar: _buildAppbar(),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: _buildBottomNavbar(),
    );
  }

  AppBar _buildAppbar() {
    return BelanjainAppbar(
      context: context,
      backButton: false,
      title: Text(
        _appbarTitles[_selectedIndex],
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildBottomNavbar() {
    final List<String> navbarIcons = [
      IntransporiaImages.courierNavbarHome,
      IntransporiaImages.courierNavbarOrder,
      IntransporiaImages.courierNavbarHistory,
      IntransporiaImages.courierNavbarSetting
    ];

    final List<String> navbarActiveIcons = [
      IntransporiaImages.courierNavbarHomeActive,
      IntransporiaImages.courierNavbarOrderActive,
      IntransporiaImages.courierNavbarHistoryActive,
      IntransporiaImages.courierNavbarSettingActive
    ];

    final List<String> navbarLabels = [
      'Beranda',
      'Pesanan',
      'Riwayat',
      'Pengaturan'
    ];

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      currentIndex: _selectedIndex,
      onTap: onIndexChanged,
      items: List.generate(navbarIcons.length, (index) {
        return BottomNavigationBarItem(
          icon: index == _selectedIndex
              ? Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(navbarActiveIcons[index]),
                )
              : Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: SvgPicture.asset(navbarIcons[index]),
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
        color: Constants.borderBase2,
      ),
    );
  }

  void onIndexChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
