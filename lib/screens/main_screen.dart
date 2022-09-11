import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intransporia/blocs/navbar/navbar.dart';
import 'package:intransporia/screens/account/account_screen.dart';
import 'package:intransporia/screens/home/home_screen.dart';
import 'package:intransporia/widgets/navbar/navbar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavbarBloc navbarBloc = context.read<NavbarBloc>();

    return BlocBuilder<NavbarBloc, NavbarItem>(
      bloc: navbarBloc,
      builder: (_, item) {
        Widget? body;

        if (item == NavbarItem.home) {
          body = const HomeScreen();
        } else if (item == NavbarItem.account) {
          body = const AccountScreen();
        }

        return Scaffold(
          body: body,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add_rounded),
          ),
          bottomNavigationBar: NavbarWidget(
            item: item,
            onSelected: (i) => navbarBloc.add(NavbarItemUpdated(i)),
          ),
        );
      },
    );
  }
}
