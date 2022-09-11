import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intransporia/blocs/navbar/navbar.dart';
import 'package:intransporia/cores/cores.dart';

class NavbarWidget extends StatefulWidget {
  final NavbarItem item;
  final Function(NavbarItem) onSelected;

  const NavbarWidget({Key? key, required this.item, required this.onSelected})
      : super(key: key);

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late bool _isSelected = true;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 6.0,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: NavbarItem.values.map((e) {
          String? icon;
          String? label;

          if (e == NavbarItem.home) {
            icon = _isSelected
                ? IntransporiaImages.homeFilled
                : IntransporiaImages.homeRegular;
            label = 'Beranda';
          } else if (e == NavbarItem.report) {
            icon = '';
            label = 'Lapor';
          } else {
            icon = _isSelected
                ? IntransporiaImages.userRegular
                : IntransporiaImages.userFilled;
            label = 'Akun';
          }

          return IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            iconSize: 80.0,
            onPressed: e == NavbarItem.report
                ? null
                : () {
                    setState(() => _isSelected = !_isSelected);
                    widget.onSelected(e);
                  },
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon.isEmpty
                    ? const SizedBox(height: 20.0)
                    : SvgPicture.asset(icon),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
