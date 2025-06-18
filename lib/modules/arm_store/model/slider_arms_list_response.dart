import 'package:tixe_flutter_app/modules/arm_store/model/all_arms_list_response.dart';

class SliderArmsListResponse {
  List<ArmItem>? arms;

  SliderArmsListResponse({this.arms});

  factory SliderArmsListResponse.fromJson(Map<String, dynamic> json) {
    return SliderArmsListResponse(
      arms: (json['data'] as List?)?.map((e) => ArmItem.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': arms?.map((e) => e.toJson()).toList(),
    };
  }
}

