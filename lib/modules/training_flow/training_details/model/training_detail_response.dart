import 'package:tixe_flutter_app/global/model/global_response.dart';

class TrainingDetailResponse {
  GlobalResponse? globalResponse;
  Data? data;

  TrainingDetailResponse({
    this.globalResponse,
    this.data,
  });

  factory TrainingDetailResponse.fromJson(Map<String, dynamic> json) =>
      TrainingDetailResponse(
        globalResponse: GlobalResponse.fromJson(json),
        data: json["data"] == null ? null : Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        "globalResponse": globalResponse?.toJson(),
        "data": data?.toJson(),
      };
}

class Data {
  TrainingDetail? trainingService;
  ReviewStatistics? reviewStatistics;
  List<TrainingReviewList>? reviewList;

  Data({
    this.trainingService,
    this.reviewStatistics,
    this.reviewList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trainingService: json["training_service"] == null
            ? null
            : TrainingDetail.fromJson(json["training_service"]),
        reviewStatistics: json["review_statistics"] == null
            ? null
            : ReviewStatistics.fromJson(json["review_statistics"]),
        reviewList: json["review_list"] == null
            ? []
            : List<TrainingReviewList>.from(
                json["review_list"]!.map((x) => TrainingReviewList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "training_service": trainingService?.toJson(),
        "review_statistics": reviewStatistics?.toJson(),
        "review_list": reviewList == null
            ? []
            : List<dynamic>.from(reviewList!.map((x) => x.toJson())),
      };
}

class ReviewStatistics {
  num? averageRating;
  int? totalReviews;

  ReviewStatistics({
    this.averageRating,
    this.totalReviews,
  });

  factory ReviewStatistics.fromJson(Map<String, dynamic> json) =>
      ReviewStatistics(
        averageRating: json["average_rating"],
        totalReviews: json["total_reviews"],
      );

  Map<String, dynamic> toJson() => {
        "average_rating": averageRating,
        "total_reviews": totalReviews,
      };
}

class TrainingDetail {
  int? id;
  String? title;
  String? subTitle;
  String? enrolmentStatus;
  String? type;
  String? lat;
  String? lon;
  String? description;
  String? image;
  List<String>? galleryImages;
  int? maxEnrollment;
  String? enrollmentFee;
  String? conveiencesFee;
  String? address;
  String? scheduleType;
  String? discountCode;
  List<DateBased>? dateBased;
  List<DurationBased>? durationBased;
  List<GearsEquipment>? prerequisites;
  List<GearsEquipment>? gearsEquipments;

  TrainingDetail({
    this.id,
    this.title,
    this.subTitle,
    this.enrolmentStatus,
    this.type,
    this.lat,
    this.lon,
    this.description,
    this.image,
    this.galleryImages,
    this.maxEnrollment,
    this.enrollmentFee,
    this.conveiencesFee,
    this.address,
    this.scheduleType,
    this.discountCode,
    this.dateBased,
    this.durationBased,
    this.prerequisites,
    this.gearsEquipments,
  });

  factory TrainingDetail.fromJson(Map<String, dynamic> json) => TrainingDetail(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        enrolmentStatus: json["enrolment_status"],
        type: json["type"],
        lat: json["lat"],
        lon: json["lon"],
        description: json["description"],
        image: json["image"],
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"]!.map((x) => x)),
        maxEnrollment: json["max_enrollment"],
        enrollmentFee: json["enrollment_fee"],
        conveiencesFee: json["conveiences_fee"],
        address: json["address"],
        scheduleType: json["schedule_type"],
        discountCode: json["discount_code"],
        dateBased: json["date_based"] == null
            ? []
            : List<DateBased>.from(
                json["date_based"]!.map((x) => DateBased.fromJson(x))),
        durationBased: json["duration_based"] == null
            ? []
            : List<DurationBased>.from(
                json["duration_based"]!.map((x) => DurationBased.fromJson(x))),
        prerequisites: json["prerequisites"] == null
            ? []
            : List<GearsEquipment>.from(
                json["prerequisites"]!.map((x) => GearsEquipment.fromJson(x))),
        gearsEquipments: json["gears_equipments"] == null
            ? []
            : List<GearsEquipment>.from(json["gears_equipments"]!
                .map((x) => GearsEquipment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "enrolment_status": enrolmentStatus,
        "type": type,
        "lat": lat,
        "lon": lon,
        "description": description,
        "image": image,
        "gallery_images": galleryImages == null
            ? []
            : List<dynamic>.from(galleryImages!.map((x) => x)),
        "max_enrollment": maxEnrollment,
        "enrollment_fee": enrollmentFee,
        "conveiences_fee": conveiencesFee,
        "address": address,
        "schedule_type": scheduleType,
        "discount_code": discountCode,
        "date_based": dateBased == null
            ? []
            : List<dynamic>.from(dateBased!.map((x) => x.toJson())),
        "duration_based": durationBased == null
            ? []
            : List<dynamic>.from(durationBased!.map((x) => x.toJson())),
        "prerequisites": prerequisites == null
            ? []
            : List<dynamic>.from(prerequisites!.map((x) => x.toJson())),
        "gears_equipments": gearsEquipments == null
            ? []
            : List<dynamic>.from(gearsEquipments!.map((x) => x.toJson())),
      };
}

class DateBased {
  String? startDate;
  String? endDate;
  List<Date>? dates;

  DateBased({
    this.startDate,
    this.endDate,
    this.dates,
  });

  factory DateBased.fromJson(Map<String, dynamic> json) => DateBased(
        startDate: json["start_date"],
        endDate: json["end_date"],
        dates: json["dates"] == null
            ? []
            : List<Date>.from(json["dates"]!.map((x) => Date.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "dates": dates == null
            ? []
            : List<dynamic>.from(dates!.map((x) => x.toJson())),
      };
}

class Date {
  String? date;
  String? startAt;
  String? endAt;

  Date({
    this.date,
    this.startAt,
    this.endAt,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        date: json["date"],
        startAt: json["start_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "start_at": startAt,
        "end_at": endAt,
      };
}

class DurationBased {
  String? startDate;
  String? endDate;
  List<Day>? days;

  DurationBased({
    this.startDate,
    this.endDate,
    this.days,
  });

  factory DurationBased.fromJson(Map<String, dynamic> json) => DurationBased(
        startDate: json["start_date"],
        endDate: json["end_date"],
        days: json["days"] == null
            ? []
            : List<Day>.from(json["days"]!.map((x) => Day.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start_date": startDate,
        "end_date": endDate,
        "days": days == null
            ? []
            : List<dynamic>.from(days!.map((x) => x.toJson())),
      };
}

class Day {
  String? day;
  String? startAt;
  String? endAt;

  Day({
    this.day,
    this.startAt,
    this.endAt,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        day: json["day"],
        startAt: json["start_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "start_at": startAt,
        "end_at": endAt,
      };
}

class GearsEquipment {
  String? title;

  GearsEquipment({
    this.title,
  });

  factory GearsEquipment.fromJson(Map<String, dynamic> json) => GearsEquipment(
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}

class TrainingReviewList {
  int? id;
  int? trainingServiceId;
  int? rating;
  String? comment;
  User? user;
  String? date;

  TrainingReviewList({
    this.id,
    this.trainingServiceId,
    this.rating,
    this.comment,
    this.user,
    this.date,
  });

  factory TrainingReviewList.fromJson(Map<String, dynamic> json) => TrainingReviewList(
    id: json["id"],
    trainingServiceId: json["training_service_id"],
    rating: json["rating"],
    comment: json["comment"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "training_service_id": trainingServiceId,
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
  ProfileDetails? profileDetails;

  User({
    this.id,
    this.email,
    this.name,
    this.profileDetails,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    profileDetails: json["profile_details"] == null ? null : ProfileDetails.fromJson(json["profile_details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
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