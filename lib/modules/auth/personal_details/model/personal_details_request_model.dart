

import 'dart:io';

import 'package:dio/dio.dart';

class PersonalDetailsRequestModel {
  final String email;
  final String name;
  final String country;
  final String state;
  final String city;
  final String address;
  final File? profilePhoto;
  final File? armsLicense;

  PersonalDetailsRequestModel({
    required this.email,
    required this.name,
    required this.country,
    required this.state,
    required this.city,
    required this.address,
    required this.profilePhoto,
    required this.armsLicense,
  });


  Future<Map<String, dynamic>> toJson() async{
    final Map<String, dynamic> map ={
      'state': state,
      'city': city,
      'country': country,
      'email': email,
      'address': address,
      'name': name,
    };
    if(profilePhoto != null){
      map['profile_photo'] = await MultipartFile.fromFile(profilePhoto!.path);
    }
    if(armsLicense != null){
      map['arms_license'] = await MultipartFile.fromFile(armsLicense!.path);
    }
    return map;
  }
}
