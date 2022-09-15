// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainCategoryScreen extends StatefulWidget {
  const BelanjainCategoryScreen({super.key});

  @override
  State<BelanjainCategoryScreen> createState() =>
      _BelanjainCategoryScreenState();
}

class _BelanjainCategoryScreenState extends State<BelanjainCategoryScreen> {
  final List<String> _categoryAssets = [
    IntransporiaImages.belanjainCategoryElectronic,
    IntransporiaImages.belanjainCategoryFashion,
    IntransporiaImages.belanjainCategoryParent,
    IntransporiaImages.belanjainCategoryFreshProduct,
    IntransporiaImages.belanjainCategoryFood,
    IntransporiaImages.belanjainCategoryBeverage,
    IntransporiaImages.belanjainCategoryHealth
  ];

  final List<String> _categoryText = [
    'Gadget & Elekronik',
    'Fashion',
    'Ibu & Anak',
    'Produk Segar',
    'Makanan',
    'Minuman',
    'Kesehatan & Kecantikan'
  ];

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
      title: Text(
        'Pilih kategori',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        ListView.separated(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
          itemBuilder: (context, index) {
            return _buildItem(
              svgUrl: _categoryAssets[index],
              text: _categoryText[index],
            );
          },
          separatorBuilder: (context, index) => Container(),
          itemCount: _categoryAssets.length,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildCancelButton(),
        ),
      ],
    );
  }

  Widget _buildItem({
    required String svgUrl,
    required String text,
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(svgUrl),
            SizedBox(width: 24),
            Expanded(
              child: Text(text),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFBFAFF),
        border: Border(
          top: BorderSide(color: Color(0xFFF2F4F5)),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(60),
          child: Ink(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Color(0xFFFBFAFF),
            ),
            child: Text(
              'Cancel',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
