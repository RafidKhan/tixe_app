import 'package:dio/dio.dart';

class PersonalDetailsRequestModel {
  final String email;
  final String name;
  final String country;
  final String state;
  final String city;
  final String address;

  PersonalDetailsRequestModel({
    required this.email,
    required this.name,
    required this.country,
    required this.state,
    required this.city,
    required this.address,
  });

  factory PersonalDetailsRequestModel.fromJson(Map<String, dynamic> json) {
    return PersonalDetailsRequestModel(
      state: json['state'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'city': city,
      'country': country,
      'email': email,
      'address': address,
      'name': name,
    };
  }
}
