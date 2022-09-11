import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intransporia/blocs/custom_bloc_observer.dart';
import 'package:intransporia/blocs/intransporia/intransporia.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/route_generator.dart';
import 'package:intransporia/screens/splash/splash_screen.dart';
import 'package:intransporia/services/services.dart';
import 'package:intransporia/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

  await Hive.initFlutter();
  await Hive.openBox('account');

  Bloc.observer = CustomBlocObserver();

  AppSystem.setup();

  runApp(
    BlocProvider(
      create: (_) => IntransporiaBloc()..add(IntransporiaStart()),
      child: const Intransporia(),
    ),
  );
}

class Intransporia extends StatelessWidget {
  const Intransporia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intransporia',
      theme: IntransporiaTheme.apply,
      navigatorKey: locator<NavigationServices>().navigationKey,
      home: const SplashScreen(),
      onGenerateRoute: (routeSettings) =>
          RouteGenerator(routeSettings).generate(),
    );
  }
}

class AppSystem {
  static dynamic setup() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );
  }
}
