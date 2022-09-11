import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intransporia/blocs/authentication/authentication.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/repositories/repositories.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AccountRepository accountRepository = locator<AccountRepository>();
  static AuthenticationState get initialState => AuthenticationInitialState();

  AuthenticationBloc() : super(initialState) {
    on<OnAuthButtonPressed>((event, emit) async {
      emit(AuthenticationLoading(true));

      try {
        await accountRepository.save(event.entries);

        emit(AuthenticationSuccess());
      } catch (e) {
        emit(AuthenticationFailure(e.toString()));
      }
    });
  }
}
