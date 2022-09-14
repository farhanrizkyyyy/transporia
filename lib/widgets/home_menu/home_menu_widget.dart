import 'package:flutter/material.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/model/home_menu.dart';
import 'package:intransporia/theme/theme.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<HomeMenu> items = HomeMenu.items;

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(20.0, 26.0, 20.0, 10.0),
      itemCount: items.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (_, i) {
        return GestureDetector(
          onTap: () {
            if (i == 1) {
              Navigator.pushNamed(context, IntransporiaRoutes.belanjain);
            }
          },
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Constants.borderBase),
                ),
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: items[i].bgColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Image.asset(items[i].icon),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  items[i].name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 14.0),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
