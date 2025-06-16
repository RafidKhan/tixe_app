class StoreArmDetail {
  int? code;
  String? message;
  GearDetailData? data;

  StoreArmDetail({this.code, this.message, this.data});

  factory StoreArmDetail.fromJson(Map<String, dynamic> json) {
    return StoreArmDetail(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? GearDetailData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class GearDetailData {
  GearItem? gear;
  List<ReviewItem>? reviewList;
  ReviewStatistics? reviewStatistics;

  GearDetailData({this.gear, this.reviewList, this.reviewStatistics});

  factory GearDetailData.fromJson(Map<String, dynamic> json) {
    return GearDetailData(
      gear: json['gear'] != null ? GearItem.fromJson(json['gear']) : null,
      reviewList: (json['review_list'] as List?)
          ?.map((e) => ReviewItem.fromJson(e))
          .toList(),
      reviewStatistics: json['review_statistics'] != null
          ? ReviewStatistics.fromJson(json['review_statistics'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'gear': gear?.toJson(),
      'review_list': reviewList?.map((e) => e.toJson()).toList(),
      'review_statistics': reviewStatistics?.toJson(),
    };
  }
}

class GearItem {
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

  GearItem({
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

  factory GearItem.fromJson(Map<String, dynamic> json) {
    return GearItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      featureImage: json['feature_image'],
      featureImages: (json['feature_images'] as List?)?.cast<String>(),
      price: json['price'],
      quantityAvailable: json['quantity_available'],
      dailyRentalPrice: json['daily_rental_price'],
      rentalOption: json['rental_option'],
      categories: (json['categories'] as List?)
          ?.map((e) => Category.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'feature_image': featureImage,
      'feature_images': featureImages,
      'price': price,
      'quantity_available': quantityAvailable,
      'daily_rental_price': dailyRentalPrice,
      'rental_option': rentalOption,
      'categories': categories?.map((e) => e.toJson()).toList(),
    };
  }
}

class ReviewItem {
  int? id;
  int? gearId;
  int? rating;
  String? comment;
  ReviewUser? user;
  String? date;

  ReviewItem({
    this.id,
    this.gearId,
    this.rating,
    this.comment,
    this.user,
    this.date,
  });

  factory ReviewItem.fromJson(Map<String, dynamic> json) {
    return ReviewItem(
      id: json['id'],
      gearId: json['gear_id'],
      rating: json['rating'],
      comment: json['comment'],
      user: json['user'] != null ? ReviewUser.fromJson(json['user']) : null,
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'gear_id': gearId,
      'rating': rating,
      'comment': comment,
      'user': user?.toJson(),
      'date': date,
    };
  }
}

class ReviewUser {
  int? id;
  String? email;
  String? name;
  String? armsLicense;
  dynamic profileDetails;

  ReviewUser({
    this.id,
    this.email,
    this.name,
    this.armsLicense,
    this.profileDetails,
  });

  factory ReviewUser.fromJson(Map<String, dynamic> json) {
    return ReviewUser(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      armsLicense: json['arms_license'],
      profileDetails: json['profile_details'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'arms_license': armsLicense,
      'profile_details': profileDetails,
    };
  }
}

class ReviewStatistics {
  int? averageRating;
  int? totalReviews;

  ReviewStatistics({this.averageRating, this.totalReviews});

  factory ReviewStatistics.fromJson(Map<String, dynamic> json) {
    return ReviewStatistics(
      averageRating: json['average_rating'],
      totalReviews: json['total_reviews'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'average_rating': averageRating,
      'total_reviews': totalReviews,
    };
  }
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

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      slug: json['slug'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'slug': slug,
      'description': description,
    };
  }
}
