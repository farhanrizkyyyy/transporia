import 'package:get_it/get_it.dart';
import 'package:intransporia/repositories/repositories.dart';
import 'package:intransporia/services/navigation_services.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(NavigationServices());
  locator.registerSingleton(AccountRepository());
}
