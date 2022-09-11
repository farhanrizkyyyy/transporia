abstract class AuthenticationState {}

class AuthenticationInitialState extends AuthenticationState {
  @override
  String toString() => 'AuthenticationState';
}

class AuthenticationLoading extends AuthenticationState {
  final bool isLoading;

  AuthenticationLoading(this.isLoading);

  @override
  String toString() => 'AuthenticationLoading';
}

class AuthenticationSuccess extends AuthenticationState {
  @override
  String toString() => 'AuthenticationSuccess';
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure(this.message);

  @override
  String toString() => 'AuthenticationFailure';
}
