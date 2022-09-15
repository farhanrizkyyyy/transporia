// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/theme/constants.dart';

class BelanjainDetailProductScreen extends StatefulWidget {
  const BelanjainDetailProductScreen({super.key});

  @override
  State<BelanjainDetailProductScreen> createState() =>
      _BelanjainDetailProductScreenState();
}

class _BelanjainDetailProductScreenState
    extends State<BelanjainDetailProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Stack(
            children: [
              Image.network(
                'https://via.placeholder.com/150.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.65,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildDescription(
                    productName: 'Driscolls Blueberry Organik Impor 170g',
                    price: 'Rp50.900',
                    category: 'Makanan',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent.',
                    warehouse: 'Gambir',
                  ),
                ),
              )
            ],
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.topLeft,
              child: _buildBackButton(),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildAddToCartButton(),
        ),
      ],
    );
  }

  Widget _buildDescription({
    required String productName,
    required String price,
    required String category,
    required String description,
    required String warehouse,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(28, 28, 28, 100),
      width: double.infinity,
      // height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(18),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16),
          Center(
            child: Text(
              price,
              style: TextStyle(
                color: Constants.orange2,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(thickness: 1),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.ink4,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Deskripsi',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.ink4,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Warehouse',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12),
              Text(
                warehouse,
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.ink4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Constants.orange2,
        ),
        child: Transform.scale(
          scale: .7,
          child: SvgPicture.asset(
            IntransporiaImages.arrowLeftOrange,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return Material(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(60),
          child: Ink(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Constants.orange2,
            ),
            child: Text(
              'Masukkan ke keranjang',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
