
class MyWorkoutsResponse {
  int? code;
  String? message;
  Data? data;

  MyWorkoutsResponse({
    this.code,
    this.message,
    this.data,
  });

  factory MyWorkoutsResponse.fromJson(Map<String, dynamic> json) => MyWorkoutsResponse(
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
  List<MyWorkout>? services;
  MyWorkoutPagination? pagination;

  Data({
    this.services,
    this.pagination,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    services: json["services"] == null ? [] : List<MyWorkout>.from(json["services"]!.map((x) => MyWorkout.fromJson(x))),
    pagination: json["pagination"] == null ? null : MyWorkoutPagination.fromJson(json["pagination"]),
  );

  Map<String, dynamic> toJson() => {
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
    "pagination": pagination?.toJson(),
  };
}

class MyWorkoutPagination {
  int? pageSize;
  int? page;
  int? totalPage;
  int? totalRecords;

  MyWorkoutPagination({
    this.pageSize,
    this.page,
    this.totalPage,
    this.totalRecords,
  });

  factory MyWorkoutPagination.fromJson(Map<String, dynamic> json) => MyWorkoutPagination(
    pageSize: json["page_size"],
    page: json["page"],
    totalPage: json["total_page"],
    totalRecords: json["total_records"],
  );

  Map<String, dynamic> toJson() => {
    "page_size": pageSize,
    "page": page,
    "total_page": totalPage,
    "total_records": totalRecords,
  };
}



class MyWorkout {
  int? id;
  String? title;
  String? duration;
  bool? isPremium;
  String? description;
  String? image;
  int? calories;
  String? enrollmentFee;

  MyWorkout({
    this.id,
    this.title,
    this.duration,
    this.isPremium,
    this.description,
    this.image,
    this.calories,
    this.enrollmentFee,
  });

  factory MyWorkout.fromJson(Map<String, dynamic> json) => MyWorkout(
    id: json["id"],
    title: json["title"],
    duration: json["duration"],
    isPremium: json["is_premium"],
    description: json["description"],
    image: json["image"],
    calories: json["calories"],
    enrollmentFee: json["enrollment_fee"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "duration": duration,
    "is_premium": isPremium,
    "description": description,
    "image": image,
    "calories": calories,
    "enrollment_fee": enrollmentFee,
  };
}

