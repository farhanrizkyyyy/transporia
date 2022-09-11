abstract class IntransporiaState {}

class IntransporiaInitialState extends IntransporiaState {
  @override
  String toString() => 'IntransporiaInitialState';
}

class IntransporiaLoading extends IntransporiaState {
  @override
  String toString() => 'IntransporiaLoading';
}

class Authenticated extends IntransporiaState {
  @override
  String toString() => 'Authenticated';
}

class Unauthenticated extends IntransporiaState {
  @override
  String toString() => 'Unauthenticated';
}