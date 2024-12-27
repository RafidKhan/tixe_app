class ConfirmTrainingEnrollmentRequest {
  int? enrollmentId;
  num? trainingFee;
  num? gearsCost;
  num? conveiences;
  num? discountAmount;
  num? grandTotal;

  ConfirmTrainingEnrollmentRequest({
    required this.enrollmentId,
    required this.trainingFee,
    required this.gearsCost,
    required this.conveiences,
    required this.discountAmount,
    required this.grandTotal,
  });

  factory ConfirmTrainingEnrollmentRequest.fromJson(
          Map<String, dynamic> json) =>
      ConfirmTrainingEnrollmentRequest(
        enrollmentId: json["enrollment_id"],
        trainingFee: json["training_fee"],
        gearsCost: json["gears_cost"],
        conveiences: json["conveiences"],
        discountAmount: json["discount_amount"],
        grandTotal: json["grand_total"],
      );

  Map<String, dynamic> toJson() => {
        "enrollment_id": enrollmentId,
        "training_fee": trainingFee,
        "gears_cost": gearsCost,
        "conveiences": conveiences,
        "discount_amount": discountAmount,
        "grand_total": grandTotal,
      };
}
