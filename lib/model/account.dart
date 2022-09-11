import 'package:intransporia/model/city.dart';
import 'package:intransporia/model/gender.dart';

class Account {
  final String? name;
  final String? email;
  final String? phoneNum;
  final String? birthDate;
  final String? gender;
  final String? city;

  Account({
    this.name,
    this.email,
    this.phoneNum,
    this.birthDate,
    this.gender,
    this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone_num': phoneNum,
      'birth_date': birthDate,
      'gender': gender,
      'city': city,
    };
  }

  static Account fromMap(Map<String, dynamic> data) {
    return Account(
      name: data['name'] as String,
      email: data['email'] as String,
      phoneNum: data['phone_num'] as String,
      birthDate: data['birth_date'] as String,
      gender: data['gender'] as String,
      city: data['city'] as String,
    );
  }

  Account copy({
    String? name,
    String? email,
    String? phoneNum,
    String? birthDate,
    String? gender,
    String? city,
  }) {
    return Account(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNum: phoneNum ?? this.phoneNum,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      city: city ?? this.city,
    );
  }

  static Map<String, dynamic> dummy = {
    'name': 'John Doe',
    'email': 'johndoe@mail.com',
    'phone_num': '+6281234567890',
    'birth_date': '1999-01-19 03:14:07',
    'gender': Gender.items.first.genderName,
    'city': City.items.first.cityName,
  };
}
