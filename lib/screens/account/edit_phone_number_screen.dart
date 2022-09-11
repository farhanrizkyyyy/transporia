import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intransporia/theme/theme.dart';
import 'package:intransporia/widgets/widgets.dart';

class EditPhoneNumberScreen extends StatefulWidget {
  const EditPhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<EditPhoneNumberScreen> createState() => _EditPhoneNumberScreenState();
}

class _EditPhoneNumberScreenState extends State<EditPhoneNumberScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _phoneNumCtl = TextEditingController();

  @override
  void dispose() {
    _phoneNumCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Nomor Handphone'),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              SizedBox(
                child: Text(
                  '+62',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Constants.borderBase2),
                ),
              ),
              Expanded(
                child: FormWidget(
                  padding: const EdgeInsets.only(left: 6.0),
                  controller: _phoneNumCtl,
                  labelText: 'Nomor Handphone',
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DefaultButton(
        label: 'Lanjutkan',
        onPressed: () {},
      ),
    );
  }
}
