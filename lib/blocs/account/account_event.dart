abstract class AccountEvent {}

class LoadAccount extends AccountEvent {
  @override
  String toString() => 'LoadAccount';
}

class OnUpdateAccount extends AccountEvent {
  final String? name;
  final String? email;
  final String? phoneNum;
  final String? birthDate;
  final String? gender;
  final String? city;

  OnUpdateAccount({
    this.name,
    this.email,
    this.phoneNum,
    this.birthDate,
    this.gender,
    this.city,
  });
}
