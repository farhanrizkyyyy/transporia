import 'package:intransporia/model/account.dart';

abstract class AccountState {}

class AccountInitialState extends AccountState {
  @override
  String toString() => 'AccountInitialState';
}

class AccountLoading extends AccountState {
  @override
  String toString() => 'AccountLoading';
}

class AccountLoaded extends AccountState {
  final Account account;

  AccountLoaded(this.account);

  @override
  String toString() => 'AccountLoaded';
}

class AccountLoadFailure extends AccountState {
  final String message;

  AccountLoadFailure(this.message);

  @override
  String toString() => 'AccountLoadFailure: $message';
}

class AccountUpdated extends AccountState {
  @override
  String toString() => 'AccountUpdated';
}

class AccountUpdateFailure extends AccountState {
  final String message;

  AccountUpdateFailure(this.message);

  @override
  String toString() => 'AccountUpdateFailure';
}
