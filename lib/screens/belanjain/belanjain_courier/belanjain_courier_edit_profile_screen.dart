// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/appbars/belanjain_appbar.dart';
import 'package:intransporia/widgets/forms/form_label.dart';
import 'package:intransporia/widgets/forms/forms.dart';

class BelanjainCourierEditProfileScreen extends StatefulWidget {
  const BelanjainCourierEditProfileScreen({super.key});

  @override
  State<BelanjainCourierEditProfileScreen> createState() =>
      _BelanjainCourierEditProfileScreenState();
}

class _BelanjainCourierEditProfileScreenState
    extends State<BelanjainCourierEditProfileScreen> {
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
        'Edit Profile',
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
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: showModal,
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFD4D7E3).withOpacity(.25),
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: Constants.ink3,
                  ),
                ),
              ),
              SizedBox(height: 30),
              FormLabel(labelText: 'Nama Toko'),
              FormWidget(
                hintText: 'Nama Toko',
                initialValue: 'Adam Jr',
              ),
              SizedBox(height: 20),
              FormLabel(labelText: 'Alamat'),
              FormWidget(
                hintText: 'Alamat',
                initialValue: 'Gambir, Central Jakarta City, Jakarta',
                maxLines: 2,
                minLines: 1,
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
              'Simpan',
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
          padding: EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload photo',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, color: Constants.ink),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(60),
                          decoration: BoxDecoration(
                            color: Color(0xFFD4D7E3).withOpacity(.25),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: SvgPicture.asset(IntransporiaImages.camera),
                        ),
                        SizedBox(height: 10),
                        Text('Camera'),
                      ],
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(60),
                          decoration: BoxDecoration(
                            color: Color(0xFFD4D7E3).withOpacity(.25),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: SvgPicture.asset(IntransporiaImages.gallery),
                        ),
                        SizedBox(height: 10),
                        Text('Galeri'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
