// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';
import 'package:intransporia/widgets/forms/form_label.dart';
import 'package:intransporia/widgets/forms/form_widget.dart';

class BelanjainCourierEditPhoneScreen extends StatefulWidget {
  const BelanjainCourierEditPhoneScreen({super.key});

  @override
  State<BelanjainCourierEditPhoneScreen> createState() =>
      _BelanjainCourierEditPhoneScreenState();
}

class _BelanjainCourierEditPhoneScreenState
    extends State<BelanjainCourierEditPhoneScreen> {
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
        'Ubah Nomor HP',
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
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormLabel(labelText: 'Nomor Handphone'),
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      '+62',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Constants.borderBase2,
                              ),
                    ),
                  ),
                  Expanded(
                    child: FormWidget(
                      padding: const EdgeInsets.only(left: 6.0),
                      hintText: '8*** **** ****',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildButton(),
        ),
      ],
    );
  }

  Widget _buildButton() {
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
              'Lanjutkan',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
