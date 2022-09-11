import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intransporia/blocs/intransporia/intransporia.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/repositories/repositories.dart';

class IntransporiaBloc extends Bloc<IntransporiaEvent, IntransporiaState> {
  final AccountRepository accountRepository = locator<AccountRepository>();
  static IntransporiaState get initialState => IntransporiaInitialState();

  IntransporiaBloc() : super(initialState) {
    on<IntransporiaStart>((_, emit) async {
      emit(IntransporiaLoading());

      final bool hasAccount = await accountRepository.exists();

      if (!hasAccount) {
        emit(Unauthenticated());
      } else {
        emit(Authenticated());
      }
    });
  }
}
