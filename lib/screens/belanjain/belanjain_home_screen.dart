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
  @override
  Widget build(BuildContext context) {
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
    return Container(
      width: double.infinity,
      // height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Constants.ink4,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(IntransporiaImages.search),
          SizedBox(width: 16),
          Flexible(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Mau cari apa?',
                // hintStyle: TextStyle(fontSize: 12),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
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
        return _buildCategorySliderItem();
      },
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemCount: 10,
    );
  }

  Widget _buildCategorySliderItem() {
    return GestureDetector(
      child: Container(
        width: 142,
        height: 32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(60),
          border: Border.all(
            color: Constants.orange2,
          ),
        ),
      ),
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
        return _buildGridItem();
      }),
    );
    // return _buildGridItem();
  }

  Widget _buildGridItem() {
    return Container(
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
            child: Image.network('https://via.placeholder.com/150.png'),
          ),
          SizedBox(height: 8),
          Text(
            'Driscoll Blueberry Organik Impor 170g',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8),
          _buildPrice(
            currentPrice: 'Rp50,000',
            isDiscounted: true,
            priceWithoutDiscount: 'Rp152.000',
          ),
        ],
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
