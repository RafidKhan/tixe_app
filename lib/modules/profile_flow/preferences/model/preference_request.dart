class PreferenceRequest {
  final String? heightUnit;
  final String? weightUnit;
  final String? distanceUnit;
  final int? notificationEnabled;
  final String? notificationTurnOffFor;

  PreferenceRequest({
    required this.heightUnit,
    required this.weightUnit,
    required this.distanceUnit,
    required this.notificationEnabled,
    required this.notificationTurnOffFor,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {
      'height_unit': heightUnit,
      'weight_unit': weightUnit,
      'distance_unit': distanceUnit,
      'notification_enabled': notificationEnabled,
    };
    if (notificationTurnOffFor != null) {
      map['notification_turn_off_for'] = notificationTurnOffFor;
    }
    return map;
  }
}
