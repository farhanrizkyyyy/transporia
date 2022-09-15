// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainSearchScreen extends StatefulWidget {
  const BelanjainSearchScreen({super.key});

  @override
  State<BelanjainSearchScreen> createState() => _BelanjainSearchScreenState();
}

class _BelanjainSearchScreenState extends State<BelanjainSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return BelanjainAppbar(
      context: context,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Stasiun',
                style: TextStyle(
                  fontSize: 10,
                  color: Constants.ink3,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Gambir',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(width: 8),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: SvgPicture.asset(IntransporiaImages.dropdownOrange),
          ),
        ],
      ),
      leading: InkWell(
        borderRadius: BorderRadius.circular(60),
        onTap: () {
          Navigator.pop(context);
        },
        child: Transform.scale(
          scale: .4,
          child: SvgPicture.asset(IntransporiaImages.arrowLeftOrange),
        ),
      ),
      backButton: false,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(24),
          child: _buildSearch(),
        ),
        Expanded(
          child: _buildList(),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return TextField(
      cursorWidth: 1,
      cursorColor: Constants.orange2,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Constants.orange2,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Constants.borderBase,
            width: 2,
          ),
        ),
        prefixIcon: Transform.scale(
          scale: .4,
          child: SvgPicture.asset(IntransporiaImages.search),
        ),
        hintText: 'Cari',
      ),
    );
  }

  Widget _buildList() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 24.0,
              bottom: 20,
            ),
            child: Text(
              'Produk',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            // physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
            itemBuilder: (context, index) {
              return _buildItem(
                imageUrl: 'https://via.placeholder.com/150.png',
                name: 'Driscolls Blueberry Organik Impor 170',
                price: 'Rp129.900',
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16),
            itemCount: 10,
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String imageUrl,
    required String name,
    required String price,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              imageUrl,
              width: 65,
              height: 65,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Constants.orange2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
