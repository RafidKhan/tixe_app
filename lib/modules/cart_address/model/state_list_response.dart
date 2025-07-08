class StateListResponse {
  int? code;
  String? message;
  List<StateData>? data;

  StateListResponse({this.code, this.message, this.data});

  factory StateListResponse.fromJson(Map<String, dynamic> json) {
    return StateListResponse(
      code: json['code'],
      message: json['message'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => StateData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data?.map((item) => item.toJson()).toList(),
    };
  }
}

class StateData {
  int? id;
  String? stateName;
  String? stateCode;

  StateData({this.id, this.stateName, this.stateCode});

  factory StateData.fromJson(Map<String, dynamic> json) {
    return StateData(
      id: json['id'],
      stateName: json['state_name'],
      stateCode: json['sate_code'], // typo in original JSON preserved here
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'state_name': stateName,
      'sate_code': stateCode, // typo preserved here as well
    };
  }
}
