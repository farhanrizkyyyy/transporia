// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/cores/intransporia_routes.dart';
import 'package:intransporia/theme/constants.dart';

class BelanjainCourierSettingScreen extends StatefulWidget {
  const BelanjainCourierSettingScreen({super.key});

  @override
  State<BelanjainCourierSettingScreen> createState() =>
      BelanjainCourierSettingScreenState();
}

class BelanjainCourierSettingScreenState
    extends State<BelanjainCourierSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 8, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileSection(
            imageUrl: 'https://via.placeholder.com/150.png',
            name: 'Adam Jr',
            address: 'Gambir, Central Jakarta City, Jakarta',
          ),
          Divider(
            height: 2,
            thickness: 1,
          ),
          _buildAccountSection(
            email: 'adam@gmail.com',
            phoneNumber: '08764598459503',
          ),
          Divider(
            height: 2,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                SvgPicture.asset(IntransporiaImages.courierLogout),
                SizedBox(width: 20),
                Text('Logout'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileSection({
    required String imageUrl,
    required String name,
    required String address,
  }) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                      context, IntransporiaRoutes.belanjainCourierEditProfile);
                },
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Constants.orange2,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Foto',
            style: TextStyle(
              fontSize: 10,
              color: Constants.ink2,
            ),
          ),
          SizedBox(height: 12),
          Image.network(
            imageUrl,
            width: 95,
            height: 95,
          ),
          SizedBox(height: 12),
          Text(
            'Nama',
            style: TextStyle(
              fontSize: 10,
              color: Constants.ink2,
            ),
          ),
          SizedBox(height: 12),
          Text(name),
          SizedBox(height: 18),
          Text(
            'Alamat',
            style: TextStyle(
              fontSize: 10,
              color: Constants.ink2,
            ),
          ),
          SizedBox(height: 12),
          Text(address),
        ],
      ),
    );
  }

  Widget _buildAccountSection({
    required String email,
    required String phoneNumber,
  }) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Akun',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Email',
            style: TextStyle(
              fontSize: 10,
              color: Constants.ink2,
            ),
          ),
          SizedBox(height: 6),
          Text(email),
          SizedBox(height: 18),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context, IntransporiaRoutes.belanjainCourierEditPhone);
            },
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hp',
                        style: TextStyle(
                          fontSize: 10,
                          color: Constants.ink2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(phoneNumber),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
