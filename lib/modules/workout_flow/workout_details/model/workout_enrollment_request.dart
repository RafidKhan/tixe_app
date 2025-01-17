class WorkoutEnrollmentRequest {
  final int? workoutServiceId;
  final int? paymentId;
  final num? trainingFee;
  final num? conveiences;
  final num? discountAmount;
  final num? grandTotal;

  WorkoutEnrollmentRequest({
    required this.workoutServiceId,
    required this.paymentId,
    required this.trainingFee,
    required this.conveiences,
    required this.discountAmount,
    required this.grandTotal,
  });

  factory WorkoutEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      WorkoutEnrollmentRequest(
        workoutServiceId: json["workout_service_id"],
        paymentId: json["payment_id"],
        trainingFee: json["training_fee"],
        conveiences: json["conveiences"],
        discountAmount: json["discount_amount"],
        grandTotal: json["grand_total"],
      );

  Map<String, dynamic> toJson() => {
        "workout_service_id": workoutServiceId,
        "payment_id": paymentId,
        "training_fee": trainingFee,
        "conveiences": conveiences,
        "discount_amount": discountAmount,
        "grand_total": grandTotal,
      };
}
