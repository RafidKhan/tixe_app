
class ListWorkoutModules {
  int? code;
  String? message;
  List<PhaseData>? data;

  ListWorkoutModules({
    this.code,
    this.message,
    this.data,
  });

  factory ListWorkoutModules.fromJson(Map<String, dynamic> json) => ListWorkoutModules(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<PhaseData>.from(json["data"]!.map((x) => PhaseData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PhaseData {
  int? id;
  int? workoutServiceId;
  String? title;
  String? type;
  int? durationTime;
  String? description;
  int? cal;
  int? isCompleted;
  dynamic completedDate;
  dynamic sections;
  String? video;
  String? pdf;

  PhaseData({
    this.id,
    this.workoutServiceId,
    this.title,
    this.type,
    this.durationTime,
    this.description,
    this.cal,
    this.isCompleted,
    this.completedDate,
    this.sections,
    this.video,
    this.pdf,
  });

  factory PhaseData.fromJson(Map<String, dynamic> json) => PhaseData(
    id: json["id"],
    workoutServiceId: json["workout_service_id"],
    title: json["title"],
    type: json["type"],
    durationTime: json["duration_time"],
    description: json["description"],
    cal: json["cal"],
    isCompleted: json["is_completed"],
    completedDate: json["completed_date"],
    sections: json["sections"],
    video: json["video"],
    pdf: json["pdf"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "workout_service_id": workoutServiceId,
    "title": title,
    "type": type,
    "duration_time": durationTime,
    "description": description,
    "cal": cal,
    "is_completed": isCompleted,
    "completed_date": completedDate,
    "sections": sections,
    "video": video,
    "pdf": pdf,
  };
}




class Section {
  int? id;
  String? sectionTitle;
  String? description;

  Section({
    this.id,
    this.sectionTitle,
    this.description,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
    id: json["id"],
    sectionTitle: json["section_title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "section_title": sectionTitle,
    "description": description,
  };
}
