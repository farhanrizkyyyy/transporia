import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intransporia/blocs/authentication/authentication.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/model/account.dart';
import 'package:intransporia/services/services.dart';
import 'package:intransporia/widgets/widgets.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late bool _isLoading = false;
  late AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    super.initState();
    authenticationBloc = context.read<AuthenticationBloc>();
  }

  @override
  void dispose() {
    authenticationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: IntransporiaKeys.auth,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (_, state) {
          if (state is AuthenticationLoading) {
            setState(() => _isLoading = state.isLoading);
          } else if (state is AuthenticationSuccess) {
            Future.delayed(
              const Duration(seconds: 1),
              () => locator<NavigationServices>().pushTo(
                IntransporiaRoutes.main,
              ),
            );
          } else if (state is AuthenticationFailure) {
            debugPrint(state.message);
          }
        },
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(24.0),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Image.asset(IntransporiaImages.intransporiaLogo),
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, IntransporiaRoutes.otp);
                    },
                    child: const Text("OTP Screen"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, IntransporiaRoutes.register);
                    },
                    child: const Text("Register Screen"),
                  ),
                  Platform.isAndroid
                      ? const SizedBox()
                      : DefaultOutlinedButton(
                          padding: const EdgeInsets.only(bottom: 14.0),
                          icon: Image.asset(IntransporiaImages.apple),
                          label: 'Lanjutkan dengan Apple',
                          isLoading: false,
                          onPressed: () {},
                        ),
                  DefaultOutlinedButton(
                    padding: const EdgeInsets.only(bottom: 42.0),
                    icon: Image.asset(IntransporiaImages.google),
                    label: 'Lanjutkan dengan Google',
                    isLoading: _isLoading,
                    onPressed: () {
                      authenticationBloc.add(
                        OnAuthButtonPressed(Account.dummy),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 42.0),
                    child: Image.asset(IntransporiaImages.mitjLogo),
                  ),
                  const Tos(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
