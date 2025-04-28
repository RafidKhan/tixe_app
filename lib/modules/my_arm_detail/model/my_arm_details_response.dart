// To parse this JSON data, do
//
//     final myArmDetailResponse = myArmDetailResponseFromJson(jsonString);

import 'dart:convert';

MyArmDetailResponse myArmDetailResponseFromJson(String str) => MyArmDetailResponse.fromJson(json.decode(str));

String myArmDetailResponseToJson(MyArmDetailResponse data) => json.encode(data.toJson());

class MyArmDetailResponse {
  int? code;
  String? message;
  Data? data;

  MyArmDetailResponse({
    this.code,
    this.message,
    this.data,
  });

  factory MyArmDetailResponse.fromJson(Map<String, dynamic> json) => MyArmDetailResponse(
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
  Gear? gear;
  List<ReviewList>? reviewList;
  ReviewStatistics? reviewStatistics;

  Data({
    this.gear,
    this.reviewList,
    this.reviewStatistics,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    gear: json["gear"] == null ? null : Gear.fromJson(json["gear"]),
    reviewList: json["review_list"] == null ? [] : List<ReviewList>.from(json["review_list"]!.map((x) => ReviewList.fromJson(x))),
    reviewStatistics: json["review_statistics"] == null ? null : ReviewStatistics.fromJson(json["review_statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "gear": gear?.toJson(),
    "review_list": reviewList == null ? [] : List<dynamic>.from(reviewList!.map((x) => x.toJson())),
    "review_statistics": reviewStatistics?.toJson(),
  };
}

class Gear {
  int? id;
  String? title;
  String? description;
  String? featureImage;
  List<String>? featureImages;
  String? price;
  int? quantityAvailable;
  String? dailyRentalPrice;
  int? rentalOption;
  List<Category>? categories;

  Gear({
    this.id,
    this.title,
    this.description,
    this.featureImage,
    this.featureImages,
    this.price,
    this.quantityAvailable,
    this.dailyRentalPrice,
    this.rentalOption,
    this.categories,
  });

  factory Gear.fromJson(Map<String, dynamic> json) => Gear(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    featureImage: json["feature_image"],
    featureImages: json["feature_images"] == null ? [] : List<String>.from(json["feature_images"]!.map((x) => x)),
    price: json["price"],
    quantityAvailable: json["quantity_available"],
    dailyRentalPrice: json["daily_rental_price"],
    rentalOption: json["rental_option"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "feature_image": featureImage,
    "feature_images": featureImages == null ? [] : List<dynamic>.from(featureImages!.map((x) => x)),
    "price": price,
    "quantity_available": quantityAvailable,
    "daily_rental_price": dailyRentalPrice,
    "rental_option": rentalOption,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}

class ReviewList {
  int? id;
  int? gearId;
  num? rating;
  String? comment;
  User? user;
  String? date;

  ReviewList({
    this.id,
    this.gearId,
    this.rating,
    this.comment,
    this.user,
    this.date,
  });

  factory ReviewList.fromJson(Map<String, dynamic> json) => ReviewList(
    id: json["id"],
    gearId: json["gear_id"],
    rating: json["rating"],
    comment: json["comment"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gear_id": gearId,
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
  dynamic profileDetails;

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
    profileDetails: json["profile_details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "arms_license": armsLicense,
    "profile_details": profileDetails,
  };
}

class ReviewStatistics {
  num? averageRating;
  num? totalReviews;

  ReviewStatistics({
    this.averageRating,
    this.totalReviews,
  });

  factory ReviewStatistics.fromJson(Map<String, dynamic> json) => ReviewStatistics(
    averageRating: json["average_rating"]?.toDouble(),
    totalReviews: json["total_reviews"],
  );

  Map<String, dynamic> toJson() => {
    "average_rating": averageRating,
    "total_reviews": totalReviews,
  };
}




class Category {
  int? id;
  String? name;
  String? image;
  String? slug;
  String? description;

  Category({
    this.id,
    this.name,
    this.image,
    this.slug,
    this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    slug: json["slug"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "slug": slug,
    "description": description,
  };
}
