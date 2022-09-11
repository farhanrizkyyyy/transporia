// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/cores/intransporia_assets.dart';
import 'package:intransporia/model/city.dart';
import 'package:intransporia/model/gender.dart';
import 'package:intransporia/theme/constants.dart';
import 'package:intransporia/widgets/buttons/default_button.dart';
import 'package:intransporia/widgets/buttons/default_icon_button.dart';
import 'package:intransporia/widgets/date_picker/date_picker.dart';
import 'package:intransporia/widgets/forms/form_label.dart';
import 'package:intransporia/widgets/forms/forms.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _checkboxVal = false;
  String? _selectedGender;
  String? _selectedCity;
  DateTime? _date;

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
      centerTitle: true,
      elevation: 0,
      title: const Text(
        'Lengkapi Data',
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
      padding: EdgeInsets.all(36),
      child: Column(
        children: [
          const Text(
            'Mohon lengkapi form dibawah ini terlebih dahulu!',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: _buildForm(),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.max,
        children: [
          FormLabel(labelText: 'Nama'),
          FormWidget(
            hintText: 'Nama',
          ),
          FormLabel(labelText: 'Nomor Handphone'),
          Row(
            children: [
              SizedBox(
                child: Text(
                  '+62',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
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
          SizedBox(height: 16),
          // FormWidget(
          //   hintText: '8*** **** ****',
          // ),
          FormLabel(labelText: 'Tanggal Lahir'),
          FormWidget(
            readOnly: true,
            hintText: 'MM / DD / YYYY',
            onTap: () {
              showAppDatePicker(
                context,
                initialDate: _date,
                buttonPressed: () {},
                onDateTimeChanged: (v) => setState(
                  () => _date = v,
                ),
              );
            },
            suffixIcon: Transform.scale(
              scale: .45,
              child: SvgPicture.asset(
                IntransporiaImages.calendar,
              ),
            ),
          ),
          FormLabel(labelText: 'Jenis Kelamin'),
          DropdownWidget<String>(
            hint: 'Laki-laki / Perempuan',
            items: Gender.items
                .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem(
                    value: e.genderName,
                    child: Text(e.genderName),
                  ),
                )
                .toList(),
            value: _selectedGender,
            onChanged: (v) => setState(
              () => _selectedGender = v,
            ),
          ),
          FormLabel(labelText: 'Kota Domisili'),
          DropdownWidget<String>(
            hint: 'Jabodetabek',
            items: City.items
                .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem(
                    value: e.cityName,
                    child: Text(e.cityName),
                  ),
                )
                .toList(),
            value: _selectedCity,
            onChanged: (v) => setState(
              () => _selectedCity = v,
            ),
          ),
        ],
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Checkbox(
                  value: _checkboxVal,
                  onChanged: ((value) {
                    setState(() {
                      _checkboxVal = value!;
                    });
                  }),
                  splashRadius: 0,
                  side: BorderSide(
                    color: Constants.ink2,
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Flexible(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Dengan masuk atau mendaftar, Anda menyetujui ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Constants.ink,
                      ),
                      children: [
                        TextSpan(
                          text: 'Persyaratan Layanan ',
                          style: TextStyle(
                            color: Constants.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'dan ',
                          style: TextStyle(
                            color: Constants.ink,
                          ),
                        ),
                        TextSpan(
                          text: 'Kebijakan Privasi ',
                          style: TextStyle(
                            color: Constants.primary,
                          ),
                        ),
                        TextSpan(
                          text: 'kami',
                          style: TextStyle(
                            color: Constants.ink,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          DefaultButton(
            onPressed: () {},
            label: 'Submit',
          ),
        ],
      ),
    );
  }
}
