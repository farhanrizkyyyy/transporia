abstract class AuthenticationEvent {}

class OnAuthButtonPressed extends AuthenticationEvent {
  final Map<String, dynamic> entries;

  OnAuthButtonPressed(this.entries);
}
