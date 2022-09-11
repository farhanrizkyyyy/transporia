// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/buttons/buttons.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _currentTime = 60;

  @override
  void initState() {
    countdownTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.darkBlue,
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Verifikasi',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Constants.darkBlue,
      leading: DefaultIconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Stack(
      // clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: _buildContainerContent(),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _buildSubmitButton(),
        ),
      ],
    );
  }

  Widget _buildContainerContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(40),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Masukkan kode yang kami kirimkan melalui nomor handphone ',
              style: TextStyle(
                color: Constants.ink,
              ),
              children: [
                TextSpan(
                  text: '+62 **** **** 354',
                  style: TextStyle(
                    color: Constants.ink3,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
              // horizontal: 30,
            ),
            child: _buildOtpForm(),
          ),
          // _buildSubmitButton(),
        ],
      ),
    );
  }

  final TextEditingController _controller = TextEditingController();

  Widget _buildOtpForm() {
    return Transform.scale(
      scale: .9,
      child: PinCodeTextField(
        controller: _controller,
        pinTheme: PinTheme(
          inactiveColor: Constants.ink4,
          selectedColor: Constants.primary,
          activeColor: Constants.ink2,
        ),
        appContext: context,
        animationDuration: const Duration(milliseconds: 0),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 24,
        ),
        length: 6,
        keyboardType: TextInputType.number,
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: RichText(
              text: TextSpan(
                text: 'Kirim ulang code dalam ',
                style: TextStyle(
                  fontSize: 12,
                  color: Constants.ink,
                ),
                children: [
                  TextSpan(
                    text: '${addZero('$_currentTime')} detik',
                    style: TextStyle(
                      color: Constants.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DefaultButton(
            onPressed: () {
              log(_controller.text);
            },
            label: 'Submit',
          ),
        ],
      ),
    );
  }

  void countdownTimer() async {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_currentTime == 0) {
          setState(() {
            _timer.cancel();
          });
        } else {
          setState(() {
            _currentTime--;
          });
        }
      },
    );
  }

  String addZero(String value) {
    String result = value;

    if (result.length == 1) {
      result = '0$value';
    }

    return result;
  }
}
