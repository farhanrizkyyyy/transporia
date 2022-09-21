// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/cores/intransporia_routes.dart';
import 'package:intransporia/theme/constants.dart';

class BelanjainCourierOrderScreen extends StatefulWidget {
  const BelanjainCourierOrderScreen({super.key});

  @override
  State<BelanjainCourierOrderScreen> createState() =>
      BelanjainCourierOrderScreenState();
}

class BelanjainCourierOrderScreenState
    extends State<BelanjainCourierOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBFAFF),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.separated(
      padding: EdgeInsets.all(24),
      itemBuilder: (context, index) {
        return _buildItem(
          orderId: 'ID_DG324532',
          orderDateTime: '30 Agustus 2022  07:00 WIB',
          pickupDateTime: '30 Agustus 2022  13:00 WIB',
          customerName: 'John Doe',
          price: 'Rp297.601',
          status: 'Perlu diambil',
          qty: 3,
          item: 3,
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 24),
      itemCount: 5,
    );
  }

  Widget _buildItem({
    required String orderId,
    required String orderDateTime,
    required String pickupDateTime,
    required String customerName,
    required String price,
    required int qty,
    required int item,
    required String status,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
            context, IntransporiaRoutes.belanjainCourierDetailOrder);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 14),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.orange2,
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  orderDateTime,
                  style: TextStyle(
                    fontSize: 10,
                    color: Constants.ink3,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            // padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Constants.borderBase),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: SvgPicture.asset(IntransporiaImages
                                  .courierOrderShoppingBasket),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    customerName,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    price,
                                    style: TextStyle(
                                      color: Constants.orange2,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            orderId,
                            style: TextStyle(
                              fontSize: 12,
                              color: Constants.ink2,
                            ),
                          ),
                          Text(
                            '$qty Produk, $item item',
                            style: TextStyle(
                              fontSize: 12,
                              color: Constants.ink2,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Constants.borderBase,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(18, 4, 24, 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        pickupDateTime,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SvgPicture.asset(IntransporiaImages.belanjainTime),
                    ],
                  ),
                ),
                Divider(
                  color: Constants.borderBase,
                  thickness: 1,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 10),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
