// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainCartScreen extends StatefulWidget {
  const BelanjainCartScreen({super.key});

  @override
  State<BelanjainCartScreen> createState() => _BelanjainCartScreenState();
}

class _BelanjainCartScreenState extends State<BelanjainCartScreen> {
  // List<Widget> _carts = [];

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
        'Keranjang',
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.fromLTRB(24, 24, 24, 100),
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _buildCartItem(
                  imageUrl: 'https://via.placeholder.com/150.png',
                  productName: 'Driscolls Blueberry Organik Impor 170g',
                  price: 'Rp52.900',
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemCount: 2,
            ),
            SizedBox(height: 24),
            GestureDetector(
              onTap: () {},
              // borderRadius: BorderRadius.circular(10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFD4D7E3).withOpacity(.5),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Constants.orange2,
                    ),
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Tambah lagi',
                    style: TextStyle(
                      color: Constants.orange2,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildCheckoutButton(),
        ),
      ],
    );
  }

  Widget _buildCartItem({
    required String imageUrl,
    required String productName,
    required String price,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFFC3D0EB),
        ),
      ),
      child: Stack(
        children: [
          Row(
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
                      productName,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 12,
                        color: Constants.orange2,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -10,
            right: -10,
            child: _buildCounter(),
          ),
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Row(
      children: [
        Transform.scale(
          scale: .5,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFD4D7E3).withOpacity(.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.remove,
                color: Constants.orange2,
              ),
            ),
          ),
        ),
        SizedBox(width: 2),
        Text(
          '3',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 2),
        Transform.scale(
          scale: .5,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFD4D7E3).withOpacity(.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.add,
                color: Constants.orange2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
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
              'Checkout',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
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
