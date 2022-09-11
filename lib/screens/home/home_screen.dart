import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intransporia/blocs/account/account.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/model/account.dart';
import 'package:intransporia/theme/theme.dart';
import 'package:intransporia/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Account? _account;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      key: IntransporiaKeys.home,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          IntransporiaImages.intransporiaLogo,
          height: 35.0,
          width: 35.0,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20.0),
            height: 44.0,
            width: 44.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Constants.darkBlue3,
            ),
            child: SvgPicture.asset(
              IntransporiaImages.notification,
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
      body: BlocBuilder<AccountBloc, AccountState>(
        builder: (_, state) {
          if (state is AccountLoading) {
            return const RegularSkeleton();
          } else if (state is AccountLoaded) {
            _account = state.account;
          }

          return SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 8.0),
                    child: Text(
                      'Hello, ${_account?.name}',
                      style: textTheme.headlineLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(IntransporiaImages.location),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '${_account?.city}',
                            style: textTheme.headlineSmall
                                ?.copyWith(color: Constants.borderBase2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CarouselWidget(),
                  const HomeMenuWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
