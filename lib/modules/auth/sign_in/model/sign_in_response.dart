class SignInResponse {
  final String? status;
  final int? code;
  final String? message;
  final Data? data;
  final String? token;
  final String? tokenType;
  final int? expiresIn;

  SignInResponse({
    this.status,
    this.code,
    this.message,
    this.data,
    this.token,
    this.tokenType,
    this.expiresIn,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      status: json['status'] as String?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: json['expires_in'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'code': code,
      'message': message,
      'data': data?.toJson(),
      'token': token,
      'token_type': tokenType,
      'expires_in': expiresIn,
    };
  }
}

class Data {
  final int? id;
  final String? email;
  final String? name;
  final String? armsLicense;
  final ProfileDetails? profileDetails;

  Data({
    this.id,
    this.email,
    this.name,
    this.armsLicense,
    this.profileDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      armsLicense: json['arms_license'] as String?,
      profileDetails: json['profile_details'] != null
          ? ProfileDetails.fromJson(json['profile_details'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'arms_license': armsLicense,
      'profile_details': profileDetails?.toJson(),
    };
  }
}

class ProfileDetails {
  final String? state;
  final String? birthDate;
  final String? profilePhoto;
  final String? phone;
  final String? address;
  final String? weightUnit;
  final int? weight;
  final String? heightUnit;
  final int? height;
  final int? age;
  final String? country;
  final String? city;
  final String? nid;

  ProfileDetails({
    this.state,
    this.birthDate,
    this.profilePhoto,
    this.phone,
    this.address,
    this.weightUnit,
    this.weight,
    this.heightUnit,
    this.height,
    this.age,
    this.country,
    this.city,
    this.nid,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) {
    return ProfileDetails(
      state: json['state'] as String?,
      birthDate: json['birth_date'] as String?,
      profilePhoto: json['profile_photo'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      weightUnit: json['weight_unit'] as String?,
      weight: json['weight'] as int?,
      heightUnit: json['height_unit'] as String?,
      height: json['height'] as int?,
      age: json['age'] as int?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      nid: json['nid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'state': state,
      'birth_date': birthDate,
      'profile_photo': profilePhoto,
      'phone': phone,
      'address': address,
      'weight_unit': weightUnit,
      'weight': weight,
      'height_unit': heightUnit,
      'height': height,
      'age': age,
      'country': country,
      'city': city,
      'nid': nid,
    };
  }
}
