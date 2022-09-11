import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intransporia/blocs/account/account.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/model/account.dart';
import 'package:intransporia/model/city.dart';
import 'package:intransporia/model/gender.dart';
import 'package:intransporia/services/navigation_services.dart';
import 'package:intransporia/widgets/widgets.dart';

class EditAccountScreen extends StatefulWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _nameCtl = TextEditingController();
  final TextEditingController _bornDateCtl = TextEditingController();
  final List<Gender> _genders = Gender.items;
  final List<City> _cities = City.items;
  String? _selectedGender;
  String? _selectedCity;
  late AccountBloc _accountBloc;
  Account? _account;
  DateTime? _bornDate;

  @override
  void initState() {
    super.initState();
    _accountBloc = context.read<AccountBloc>();
  }

  @override
  void dispose() {
    _accountBloc.close();
    _nameCtl.dispose();
    _bornDateCtl.dispose();
    super.dispose();
  }

  void _onSaveButtonPressed() {
    if (_key.currentState!.validate()) {
      _accountBloc.add(OnUpdateAccount(
        name: _nameCtl.text,
        birthDate: _bornDate.toString(),
        city: _selectedCity,
        gender: _selectedGender,
        email: _account?.email,
        phoneNum: _account?.phoneNum,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil'), centerTitle: true),
      body: BlocConsumer<AccountBloc, AccountState>(
        listener: (_, state) {
          if (state is AccountUpdated) {
            locator<NavigationServices>().pop();
          }
        },
        builder: (_, state) {
          if (state is AccountLoading) {
            return const CircularProgressIndicator();
          } else if (state is AccountLoaded) {
            _account = state.account;
            _bornDate = DateTime.parse(_account!.birthDate!);
            _nameCtl.text = _account!.name!;
            _selectedGender = _account?.gender;
            _selectedCity = _account?.city;
            _bornDateCtl.text =
                '${_bornDate!.day}/${_bornDate!.month}/${_bornDate!.year}';
          }

          if (_account == null) {
            return const CircularProgressIndicator();
          }

          return Form(
            key: _key,
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                FormWidget(
                  controller: _nameCtl,
                  textCapitalization: TextCapitalization.words,
                  labelText: 'Nama',
                ),
                FormWidget(
                  readOnly: true,
                  controller: _bornDateCtl,
                  labelText: 'Tanggal Lahir',
                  suffixIcon: SvgPicture.asset(
                    IntransporiaImages.calendar,
                    fit: BoxFit.scaleDown,
                  ),
                  onTap: () => showAppDatePicker(
                    context,
                    initialDate: _bornDate,
                    buttonPressed: () {},
                    onDateTimeChanged: (v) => setState(() => _bornDate = v),
                  ),
                ),
                DropdownWidget<String>(
                  labelText: 'Jenis Kelamin',
                  items: _genders
                      .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e.genderName, child: Text(e.genderName)))
                      .toList(),
                  value: _selectedGender,
                  onChanged: (v) => setState(() => _selectedGender = v),
                ),
                DropdownWidget<String>(
                  labelText: 'Kota Domisili',
                  items: _cities
                      .map<DropdownMenuItem<String>>((e) => DropdownMenuItem(
                          value: e.cityName, child: Text(e.cityName)))
                      .toList(),
                  value: _selectedCity,
                  onChanged: (v) => setState(() => _selectedCity = v),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: DefaultButton(
        label: 'Simpan',
        onPressed: _onSaveButtonPressed,
      ),
    );
  }
}
