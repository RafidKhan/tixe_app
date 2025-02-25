
class ProfileResponse {
  String? status;
  int? code;
  String? message;
  Data? data;

  ProfileResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? email;
  String? name;
  String? armsLicense;
  ProfileDetails? profileDetails;

  Data({
    this.id,
    this.email,
    this.name,
    this.armsLicense,
    this.profileDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    armsLicense: json["arms_license"],
    profileDetails: json["profile_details"] == null ? null : ProfileDetails.fromJson(json["profile_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "arms_license": armsLicense,
    "profile_details": profileDetails?.toJson(),
  };
}

class ProfileDetails {
  String? state;
  String? profilePhoto;
  String? phone;
  String? address;
  String? weightUnit;
  String? weight;
  String? heightUnit;
  String? height;
  int? age;
  String? country;
  String? city;

  ProfileDetails({
    this.state,
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
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    state: json["state"],
    profilePhoto: json["profile_photo"],
    phone: json["phone"],
    address: json["address"],
    weightUnit: json["weight_unit"],
    weight: json["weight"],
    heightUnit: json["height_unit"],
    height: json["height"],
    age: json["age"],
    country: json["country"],
    city: json["city"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "profile_photo": profilePhoto,
    "phone": phone,
    "address": address,
    "weight_unit": weightUnit,
    "weight": weight,
    "height_unit": heightUnit,
    "height": height,
    "age": age,
    "country": country,
    "city": city,
  };
}
