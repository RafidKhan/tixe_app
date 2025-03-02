class WorkoutDetailResponse {
  int? code;
  String? message;
  Data? data;

  WorkoutDetailResponse({
    this.code,
    this.message,
    this.data,
  });

  factory WorkoutDetailResponse.fromJson(Map<String, dynamic> json) =>
      WorkoutDetailResponse(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  WorkoutService? workoutService;
  WorkoutReviewStatistics? reviewStatistics;
  List<ReviewList>? reviewList;

  Data({
    this.workoutService,
    this.reviewStatistics,
    this.reviewList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        workoutService: json["workout_service"] == null
            ? null
            : WorkoutService.fromJson(json["workout_service"]),
        reviewStatistics: json["review_statistics"] == null
            ? null
            : WorkoutReviewStatistics.fromJson(json["review_statistics"]),
        reviewList: json["review_list"] == null
            ? []
            : List<ReviewList>.from(
                json["review_list"]!.map((x) => ReviewList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workout_service": workoutService?.toJson(),
        "review_statistics": reviewStatistics?.toJson(),
        "review_list": reviewList == null
            ? []
            : List<dynamic>.from(reviewList!.map((x) => x.toJson())),
      };
}

class WorkoutReviewStatistics {
  num? averageRating;
  int? totalReviews;

  WorkoutReviewStatistics({
    this.averageRating,
    this.totalReviews,
  });

  factory WorkoutReviewStatistics.fromJson(Map<String, dynamic> json) =>
      WorkoutReviewStatistics(
        averageRating: json["average_rating"],
        totalReviews: json["total_reviews"],
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "total_reviews": totalReviews,
      };
}

class WorkoutService {
  int? id;
  String? title;
  String? type;
  String? duration;
  bool? isPremium;
  String? enrollmentStatus;
  String? asFeatured;
  String? description;
  String? gearEquipment;
  String? document;
  String? image;
  String? video;
  List<String>? galleryImages;
  List<String>? galleryVideos;
  String? preRequisitions;
  int? calories;
  String? enrollmentFee;
  String? convenienceFee;
  dynamic discountCode;

  WorkoutService({
    this.id,
    this.title,
    this.type,
    this.duration,
    this.isPremium,
    this.enrollmentStatus,
    this.asFeatured,
    this.description,
    this.gearEquipment,
    this.document,
    this.image,
    this.video,
    this.galleryImages,
    this.galleryVideos,
    this.preRequisitions,
    this.calories,
    this.enrollmentFee,
    this.convenienceFee,
    this.discountCode,
  });

  factory WorkoutService.fromJson(Map<String, dynamic> json) => WorkoutService(
        id: json["id"],
        title: json["title"],
        type: json["type"],
        duration: json["duration"],
        isPremium: json["is_premium"],
        enrollmentStatus: json["enrollment_status"],
        asFeatured: json["as_featured"],
        description: json["description"],
        gearEquipment: json["gear_equipment"],
        document: json["document"],
        image: json["image"],
        video: json["video"],
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"]!.map((x) => x)),
        galleryVideos: json["gallery_videos"] == null
            ? []
            : List<String>.from(json["gallery_videos"]!.map((x) => x)),
        preRequisitions: json["pre_requisitions"],
        calories: json["calories"],
        enrollmentFee: json["enrollment_fee"],
        convenienceFee: json["convenience_fee"],
        discountCode: json["discount_code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": type,
        "duration": duration,
        "is_premium": isPremium,
        "enrollment_status": enrollmentStatus,
        "as_featured": asFeatured,
        "description": description,
        "gear_equipment": gearEquipment,
        "document": document,
        "image": image,
        "video": video,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "gallery_videos": galleryVideos == null
            ? []
            : List<dynamic>.from(galleryVideos!.map((x) => x)),
        "pre_requisitions": preRequisitions,
        "calories": calories,
        "enrollment_fee": enrollmentFee,
        "convenience_fee": convenienceFee,
        "discount_code": discountCode,
      };
}


class ReviewList {
  int? id;
  int? workoutServiceId;
  int? rating;
  String? comment;
  User? user;
  String? date;

  ReviewList({
    this.id,
    this.workoutServiceId,
    this.rating,
    this.comment,
    this.user,
    this.date,
  });

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
    id: json["id"],
    workoutServiceId: json["workout_service_id"],
    rating: json["rating"],
    comment: json["comment"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "workout_service_id": workoutServiceId,
    "rating": rating,
    "comment": comment,
    "user": user?.toJson(),
    "date": date,
  };
}

class User {
  int? id;
  String? email;
  String? name;
  String? armsLicense;
  ProfileDetails? profileDetails;

  User({
    this.id,
    this.email,
    this.name,
    this.armsLicense,
    this.profileDetails,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
  dynamic birthDate;
  String? profilePhoto;
  dynamic phone;
  String? address;
  dynamic weightUnit;
  String? weight;
  dynamic heightUnit;
  String? height;
  int? age;
  String? country;
  String? city;
  dynamic nid;

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

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    state: json["state"],
    birthDate: json["birth_date"],
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
    nid: json["nid"],
  );

  Map<String, dynamic> toJson() => {
    "state": state,
    "birth_date": birthDate,
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
    "nid": nid,
  };
}
