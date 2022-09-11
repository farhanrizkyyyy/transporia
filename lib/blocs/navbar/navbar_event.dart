import 'package:intransporia/blocs/navbar/navbar.dart';

abstract class NavbarEvent {}

class NavbarItemUpdated extends NavbarEvent {
  final NavbarItem item;

  NavbarItemUpdated(this.item);

  @override
  String toString() => 'NavbarItemUpdated: $item';
}
