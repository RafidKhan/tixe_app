class CreateReviewRequest {
  final String serviceType;
  final int serviceId;
  final int rating;
  final String comment;

  CreateReviewRequest({
    required this.serviceType,
    required this.serviceId,
    required this.rating,
    required this.comment,
  });

  Map<String, dynamic> toJson() {
    final map = {
      'service_type': serviceType,
      'service_id': serviceId,
      'rating': rating,
      'comment': comment,
    };
    return map;
  }
}
