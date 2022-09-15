// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/cores/intransporia_routes.dart';
import 'package:intransporia/theme/constants.dart';

class BelanjainHomeScreen extends StatefulWidget {
  const BelanjainHomeScreen({super.key});

  @override
  State<BelanjainHomeScreen> createState() => _BelanjainHomeScreenState();
}

class _BelanjainHomeScreenState extends State<BelanjainHomeScreen> {
  final List<String> _categoryAssets = [
    '',
    IntransporiaImages.belanjainCategoryElectronic,
    IntransporiaImages.belanjainCategoryFashion,
    IntransporiaImages.belanjainCategoryParent,
    IntransporiaImages.belanjainCategoryFreshProduct,
    IntransporiaImages.belanjainCategoryFood,
    IntransporiaImages.belanjainCategoryBeverage,
    IntransporiaImages.belanjainCategoryHealth
  ];

  final List<String> _categoryText = [
    'Semua',
    'Gadget & Elekronik',
    'Fashion',
    'Ibu & Anak',
    'Produk Segar',
    'Makanan',
    'Minuman',
    'Kesehatan & Kecantikan'
  ];

  final List<bool> _categoryStatus = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildStasiunContainer(
            stasiunName: 'Gambir',
          ),
          SizedBox(height: 20),
          _buildSearchField(),
          SizedBox(height: 24),
          _buildCategory(),
          SizedBox(height: 20),
          _buildGridview(),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://via.placeholder.com/150.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          _buildGridview(),
        ],
      ),
    );
  }

  Widget _buildStasiunContainer({required String stasiunName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, IntransporiaRoutes.belanjainStasiun);
      },
      child: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            width: double.infinity,
            height: 75,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEF6),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned.fill(
            left: 40,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Color(0xFFEEEEF6).withOpacity(.7),
                BlendMode.srcOver,
              ),
              child: SvgPicture.asset(
                IntransporiaImages.stasiunContainerBackground,
                color: Constants.ink4,
              ),
            ),
          ),
          Positioned(
            top: 22,
            bottom: 22,
            right: 24,
            left: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(IntransporiaImages.train),
                        SizedBox(height: 2),
                        Container(
                          height: 2,
                          width: 17,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Constants.orange2,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stasiun',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Constants.ink2,
                          ),
                        ),
                        Text(
                          stasiunName,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/belanjain/search');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Constants.borderBase,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(IntransporiaImages.search),
            SizedBox(width: 16),
            Padding(
              padding: EdgeInsets.only(bottom: 2),
              child: Text(
                'Mau cari apa?',
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.ink3,
                ),
              ),
            ),
            // Flexible(
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Mau cari apa?',
            //       border: InputBorder.none,
            //       focusedBorder: InputBorder.none,
            //       errorBorder: InputBorder.none,
            //       contentPadding: EdgeInsets.zero,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kategori',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/belanjain/category');
              },
              child: Transform.scale(
                scale: 1.2,
                child: SvgPicture.asset(IntransporiaImages.category),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 32,
          child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: _buildCategorySlider(),
          ),
        ),
      ],
    );
  }

  Widget _buildCategorySlider() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 24),
      scrollDirection: Axis.horizontal,
      primary: false,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _buildCategorySliderItem(
          index: index,
          onPressed: () {
            setState(() {
              _categoryStatus[index] = true;
              for (int i = 0; i < _categoryStatus.length; i++) {
                if (i != index) {
                  _categoryStatus[i] = false;
                }
              }
            });
          },
          svgUrl: _categoryAssets[index],
          text: _categoryText[index],
          isActive: _categoryStatus[index],
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemCount: _categoryAssets.length,
    );
  }

  Widget _buildCategorySliderItem({
    required String svgUrl,
    required String text,
    Function()? onPressed,
    required bool isActive,
    required int index,
  }) {
    return ActionChip(
      label: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
      labelPadding: index == 0 ? EdgeInsets.symmetric(horizontal: 12) : null,
      elevation: 0,
      pressElevation: 0,
      onPressed: onPressed,
      backgroundColor:
          isActive ? Color(0xFFF6D5A7).withOpacity(.25) : Colors.white,
      avatar: index == 0 ? null : SvgPicture.asset(svgUrl),
    );
  }

  Widget _buildGridview() {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1 / 1.5,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(4, (index) {
        return _buildGridItem(
          imageUrl: 'https://via.placeholder.com/150.png',
          productName: 'Driscoll Blueberry Organik Impor 170g',
          currentPrice: 'Rp50,000',
          isDiscounted: true,
          priceWithoutDiscount: 'Rp152.000',
        );
      }),
    );
    // return _buildGridItem();
  }

  Widget _buildGridItem({
    required String imageUrl,
    required String productName,
    bool isDiscounted = false,
    required String currentPrice,
    String? priceWithoutDiscount,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/belanjain/detail-product');
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(imageUrl),
            ),
            SizedBox(height: 8),
            Text(
              productName,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            _buildPrice(
              currentPrice: currentPrice,
              isDiscounted: isDiscounted,
              priceWithoutDiscount: priceWithoutDiscount,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrice({
    bool isDiscounted = false,
    required String currentPrice,
    String? priceWithoutDiscount,
  }) {
    return isDiscounted
        ? Row(
            children: [
              Text(
                priceWithoutDiscount ?? '',
                style: TextStyle(
                  fontSize: 10,
                  color: Constants.ink4,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 6),
              Text(
                currentPrice,
                style: TextStyle(
                  fontSize: 10,
                  color: Constants.orange2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )
        : Text(
            currentPrice,
            style: TextStyle(
              fontSize: 10,
              color: Constants.orange2,
              fontWeight: FontWeight.w600,
            ),
          );
  }
}
