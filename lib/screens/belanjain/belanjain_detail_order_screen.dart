// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';

class BelanjainDetailOrderScreen extends StatefulWidget {
  const BelanjainDetailOrderScreen({super.key});

  @override
  State<BelanjainDetailOrderScreen> createState() =>
      _BelanjainDetailOrderScreenState();
}

class _BelanjainDetailOrderScreenState
    extends State<BelanjainDetailOrderScreen> {
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
        'Detail Pesanan',
        style: TextStyle(
          fontSize: 18,
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
            child: _buildStatusSection(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.0),
            child: _buildQrSection(
              imageUrl: IntransporiaImages.qrDummy,
              dateTime: '30 Agustus 2022 13:30 WIB',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: _buildStasiunSection(
              type: 'Pickup',
              stasiunName: 'Stasiun Gambir',
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
          _buildProductSection(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: _buildDetailSection(
              totalPrice: 'Rp90.000',
              deliveryPrice: 'Rp1.000',
              packagingPrice: 'Rp2.000',
              smartLockerPrice: 'Rp1.000',
              discount: 'Rp4.000',
            ),
          ),
          SizedBox(height: 20),
          _buildBottomSection(
            totalPrice: 'Rp90.000',
          ),
        ],
      ),
    );
  }

  Widget _buildStatusSection() {
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
        SizedBox(height: 20),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(5, (index) {
                  return Container(
                    width: MediaQuery.of(context).size.width / 7,
                    height: 1,
                    decoration: BoxDecoration(
                      color:
                          index == 4 ? Constants.borderBase : Constants.orange2,
                    ),
                  );
                }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == 5 ? Constants.borderBase : Constants.orange2,
                  ),
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFECE8FF),
                border: Border.all(
                  color: Color(0xFF5F51A1),
                ),
              ),
              child: Transform.scale(
                scale: .65,
                child: SvgPicture.asset(IntransporiaImages.belanjainCube),
              ),
            ),
            SizedBox(width: 12),
            Text(
              'Pesanan siap diambil',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQrSection({
    required String imageUrl,
    required String dateTime,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Scan QR berikut pada box paxel untuk menganbil pesanan',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: Image.asset(
            imageUrl,
            width: 152,
            height: 152,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Ambil barang sebelum ',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontFamily: 'Inter',
            ),
            children: [
              TextSpan(
                text: dateTime,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Constants.red,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStasiunSection({
    required String type,
    required String stasiunName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SvgPicture.asset(IntransporiaImages.belanjainCube),
            SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Smart Loker',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Constants.ink2,
                  ),
                ),
                Text(
                  stasiunName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
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
            color: Constants.ink2,
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

  Widget _buildDetailSection({
    required String totalPrice,
    required String deliveryPrice,
    required String packagingPrice,
    required String smartLockerPrice,
    String? discount,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Detail Transaksi',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Harga',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Constants.ink2,
              ),
            ),
            Text(
              totalPrice,
              style: TextStyle(
                fontSize: 12,
                color: Constants.ink2,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Biaya pengiriman',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Constants.ink2,
              ),
            ),
            Text(
              deliveryPrice,
              style: TextStyle(
                fontSize: 12,
                color: Constants.ink2,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Biaya packaging',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Constants.ink2,
              ),
            ),
            Text(
              packagingPrice,
              style: TextStyle(
                fontSize: 12,
                color: Constants.ink2,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Biaya smartlocker',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Constants.ink2,
              ),
            ),
            Text(
              smartLockerPrice,
              style: TextStyle(
                fontSize: 12,
                color: Constants.ink2,
              ),
            ),
          ],
        ),
        discount != null
            ? Column(
                children: [
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Diskon',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Constants.orange2,
                        ),
                      ),
                      Text(
                        discount,
                        style: TextStyle(
                          fontSize: 12,
                          color: Constants.orange2,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  Widget _buildBottomSection({required String totalPrice}) {
    return Container(
      width: double.infinity,
      // height: 200,
      padding: EdgeInsets.fromLTRB(14, 24, 14, 14),
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Constants.borderBase,
          ),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Pembayaran',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                totalPrice,
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 24),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: showModal,
              borderRadius: BorderRadius.circular(60),
              child: Ink(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Constants.orange2,
                ),
                child: Text(
                  'Pesan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    // fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(60),
              child: Ink(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(
                    color: Constants.red,
                  ),
                ),
                child: Text(
                  'Batalkan pesanan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.red,
                    // fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showModal() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(12, 16, 12, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Periksa kembali pesanan anda pastikan pesanan sudah sesuai',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 28),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '*',
                    style: TextStyle(
                      fontSize: 12,
                      color: Constants.red,
                      fontFamily: 'Inter',
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Pesanan tidak dapat di batalkan setelah pembayaran selesai',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Material(
                color: Colors.white,
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
                      'Lanjutkan Pesan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
