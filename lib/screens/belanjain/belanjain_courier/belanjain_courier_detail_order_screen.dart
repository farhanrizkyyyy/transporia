// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainCourierDetailOrderScreen extends StatefulWidget {
  const BelanjainCourierDetailOrderScreen({super.key});

  @override
  State<BelanjainCourierDetailOrderScreen> createState() =>
      _BelanjainCourierDetailOrderScreenState();
}

class _BelanjainCourierDetailOrderScreenState
    extends State<BelanjainCourierDetailOrderScreen> {
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
        'Pesanan - Runch Market',
        style: TextStyle(
          // fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
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
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 24, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: _buildStatusSection(
              status: 'Siap disimpan di smartlocker',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: _buildQrSection(
              imageUrl: IntransporiaImages.qrDummy,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildEstimationSection(
              dateTime: '30 Agustus 2022 13:00',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildLocationSection(
              stasiunName: 'Gambir',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildCustomerName(
              customerName: 'John Doe',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 24.0),
            child: _buildProductSection(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection({required String status}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status Pesanan',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        Text(status),
      ],
    );
  }

  Widget _buildQrSection({required String imageUrl}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Scan QR berikut pada smartlocker untuk membuka box',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 24),
        Image.asset(
          imageUrl,
          width: 152,
          height: 152,
        ),
      ],
    );
  }

  Widget _buildEstimationSection({required String dateTime}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estimasi Pickup',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateTime,
              style: TextStyle(),
            ),
            SvgPicture.asset(IntransporiaImages.belanjainTime),
          ],
        )
      ],
    );
  }

  Widget _buildLocationSection({required String stasiunName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Warehouse',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          stasiunName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCustomerName({required String customerName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pemesan',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8),
        Text(
          customerName,
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildProductSection({String? note}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Item Pesanan',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 28),
        ListView.separated(
          shrinkWrap: true,
          primary: false,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _buildProductItem(
              imageUrl: 'https://via.placeholder.com/150.png',
              productName: 'Driscoll Blueberry Organik Impor 170g',
              price: 'Rp129.900',
              qty: 3,
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: 2,
        ),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Catatan',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            note ?? 'Tidak ada catatan',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Constants.ink2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem({
    required String imageUrl,
    required String productName,
    required String price,
    required int qty,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    imageUrl,
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Constants.orange2,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(width: 24),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFC3D0EB),
            ),
            child: Text(
              '$qty',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
