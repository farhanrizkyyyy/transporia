import 'package:flutter/cupertino.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/theme/theme.dart';

class HomeMenu {
  final String icon;
  final String name;
  final Color bgColor;

  HomeMenu(this.icon, this.name, this.bgColor);

  static List<HomeMenu> items = [
    HomeMenu(IntransporiaImages.laporin, 'Laporin', Constants.primary2),
    HomeMenu(IntransporiaImages.belanjain, 'Belanjain', Constants.pink),
  ];
}
