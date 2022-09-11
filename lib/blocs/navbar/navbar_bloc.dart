import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intransporia/blocs/navbar/navbar.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarItem> {
  NavbarBloc() : super(NavbarItem.home) {
    on<NavbarItemUpdated>((event, emit) => emit(event.item));
  }
}
