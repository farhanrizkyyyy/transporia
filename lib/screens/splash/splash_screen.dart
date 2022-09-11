import 'package:flutter/material.dart';
import 'package:intransporia/repositories/repositories.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/services/navigation_services.dart';
import 'package:intransporia/theme/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String _unknown = 'Unknown';
  final AccountRepository _accountRepository = locator<AccountRepository>();
  final NavigationServices _navService = locator<NavigationServices>();
  late PackageInfo _info = PackageInfo(
    appName: _unknown,
    packageName: _unknown,
    version: _unknown,
    buildNumber: _unknown,
  );

  Future<void> _getAppInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() => _info = info);
  }

  Future _showSplash() async {
    final bool hasAccount = await _accountRepository.exists();

    if (!hasAccount) {
      Future.delayed(
        const Duration(seconds: 2),
        () => _navService.moveTo(IntransporiaRoutes.walktrough),
      );
    } else {
      Future.delayed(
        const Duration(seconds: 2),
        () => _navService.navigateTo(IntransporiaRoutes.main),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _getAppInfo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _showSplash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: IntransporiaKeys.splash,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
                flex: 4,
                child: Image.asset(IntransporiaImages.intransporiaLogo)),
            Expanded(
              child: Column(
                children: [
                  const Text(
                    'by',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Constants.sky3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 13.0),
                  Image.asset(IntransporiaImages.mitjLogo),
                  const SizedBox(height: 60.0),
                  Text(
                    'v${_info.version}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
