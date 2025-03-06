class FitnessDetailsRequest {
  String age;
  String height;
  String heightUnit;
  String weight;
  String weightUnit;
  String email;

  FitnessDetailsRequest({
    required this.age,
    required this.height,
    required this.heightUnit,
    required this.weight,
    required this.weightUnit,
    required this.email,
  });

  // Convert a FitnessDetailsRequest into a Map.
  Map<String, String> toJson() {
    return {
      'age': age,
      'height': height,
      'height_unit': heightUnit,
      'weight': weight,
      'weight_unit': weightUnit,
      'email': email,
    };
  }

  // Create a FitnessDetailsRequest from a Map.
  factory FitnessDetailsRequest.fromMap(Map<String, String> map) {
    return FitnessDetailsRequest(
      age: map['age'] ?? '',
      height: map['height'] ?? '',
      heightUnit: map['heightUnit'] ?? '',
      weight: map['weight'] ?? '',
      weightUnit: map['weightUnit'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
