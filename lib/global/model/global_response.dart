class GlobalResponse {
  final String? status;
  final int? code;
  final String? message;

  GlobalResponse({this.status, this.code, this.message});

  // Factory constructor to create an instance from a JSON map
  factory GlobalResponse.fromJson(Map<String, dynamic> json) {
    return GlobalResponse(
      status: json['status'] as String?,
      code: json['code'] as int?,
      message: json['message'] as String?,
    );
  }

  // Method to convert an instance back to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'code': code,
      'message': message,
    };
  }
}
