import 'package:tixe_flutter_app/modules/list_workout_add_module_selection/views/list_workout_add_module_selection_screen.dart';

class TextModuleModel {
  String title;
  String description;
  String cal;
  String durationTime;
  ModuleTypeEnum? type;
  List<Section> sections;

  TextModuleModel({
    required this.title,
    required this.description,
    required this.cal,
    required this.durationTime,
    required this.sections,
     this.type,
  });

  factory TextModuleModel.fromJson(Map<String, dynamic> json) =>
      TextModuleModel(
        title: json["title"],
        description: json["description"],
        cal: json["cal"],
        durationTime: json["duration_time"],
        sections: json["sections"] == null
            ? []
            : List<Section>.from(
                json["sections"]!.map((x) => Section.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "cal": cal,
        "duration_time": durationTime,
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
      };
}

class Section {
  String sectionTitle;
  String description;

  Section({
    required this.sectionTitle,
    required this.description,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        sectionTitle: json["section_title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "section_title": sectionTitle,
        "description": description,
      };
}
