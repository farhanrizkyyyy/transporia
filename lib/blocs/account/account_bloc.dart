import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intransporia/blocs/account/account.dart';
import 'package:intransporia/cores/cores.dart';
import 'package:intransporia/model/account.dart';
import 'package:intransporia/repositories/repositories.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository accountRepository = locator<AccountRepository>();
  static AccountState get initialState => AccountInitialState();

  AccountBloc() : super(initialState) {
    on<LoadAccount>((event, emit) async {
      emit(AccountLoading());

      try {
        final data = await accountRepository.get();

        debugPrint('Data: $data');

        emit(AccountLoaded(Account.fromMap(data!)));
      } catch (e) {
        emit(AccountLoadFailure(e.toString()));
      }
    });

    on<OnUpdateAccount>((event, emit) async {
      emit(AccountLoading());

      try {
        final Map<String, dynamic> entries = {
          'name': event.name,
          'birth_date': event.birthDate,
          'gender': event.gender,
          'city': event.city,
          'phone_num': event.phoneNum,
          'email': event.email,
        };

        await accountRepository.save(entries);

        emit(AccountUpdated());
      } catch (e) {
        emit(AccountUpdateFailure(e.toString()));
      }
    });
  }
}
