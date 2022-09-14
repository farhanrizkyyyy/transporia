import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intransporia/blocs/account/account.dart';
import 'package:intransporia/blocs/authentication/authentication.dart';
import 'package:intransporia/blocs/navbar/navbar.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/screens/account/edit_account_screen.dart';
import 'package:intransporia/screens/account/edit_phone_number_screen.dart';
import 'package:intransporia/screens/authentication/authentication_screen.dart';
import 'package:intransporia/screens/authentication/otp_screen.dart';
import 'package:intransporia/screens/authentication/register_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_base_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_cart_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_category_screen.dart';
import 'package:intransporia/screens/belanjain/belanjain_stasiun_screen.dart';
import 'package:intransporia/screens/main_screen.dart';
import 'package:intransporia/screens/splash/splash_screen.dart';
import 'package:intransporia/screens/walkthrough/walkthrough_screen.dart';

class RouteGenerator {
  final RouteSettings routeSettings;

  RouteGenerator(this.routeSettings);

  Route<dynamic>? generate() {
    // final Object? args = routeSettings.arguments;

    switch (routeSettings.name) {
      case IntransporiaRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case IntransporiaRoutes.walktrough:
        return MaterialPageRoute(builder: (_) => const WalkthroughScreen());
      case IntransporiaRoutes.auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => AuthenticationBloc(),
            child: const AuthenticationScreen(),
          ),
        );
      case IntransporiaRoutes.main:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<NavbarBloc>(create: (_) => NavbarBloc()),
              BlocProvider<AccountBloc>(
                create: (_) => AccountBloc()..add(LoadAccount()),
              ),
            ],
            child: const MainScreen(),
          ),
        );
      case IntransporiaRoutes.editAccount:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<AccountBloc>(
            create: (_) => AccountBloc()..add(LoadAccount()),
            child: const EditAccountScreen(),
          ),
        );
      case IntransporiaRoutes.editPhoneNum:
        return MaterialPageRoute(builder: (_) => const EditPhoneNumberScreen());
      case IntransporiaRoutes.otp:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case IntransporiaRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case IntransporiaRoutes.belanjain:
        return MaterialPageRoute(builder: (_) => const BelanjainBaseScreen());
      case IntransporiaRoutes.belajainCart:
        return MaterialPageRoute(builder: (_) => const BelanjainCartScreen());
      case IntransporiaRoutes.belanjainStasiun:
        return MaterialPageRoute(
            builder: (_) => const BelanjainStasiunScreen());
      case IntransporiaRoutes.belanjainCategory:
        return MaterialPageRoute(
            builder: (_) => const BelanjainCategoryScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
