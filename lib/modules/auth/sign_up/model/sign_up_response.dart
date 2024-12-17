class SignUpResponse {
  final String? status;
  final int? code;
  final String? message;
  final Data? data;

  SignUpResponse({
    this.status,
    this.code,
    this.message,
    this.data,
  });

  // Factory constructor to create an instance from JSON
  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      status: json['status'] as String?,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'code': code,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class Data {
  final String? email;
  final String? updatedAt;
  final String? createdAt;
  final int? id;

  Data({
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  // Factory constructor to create an instance from JSON
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      email: json['email'] as String?,
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: json['id'] as int?,
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
    };
  }
}
