import 'package:tixe_flutter_app/global/model/review_model.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

class SubmitReviewNavModel {
  final int serviceId;
  final ServiceType serviceType;
  final bool isUpdate;
  final ReviewModel? review;

  SubmitReviewNavModel({
    required this.serviceId,
    required this.serviceType,
    required this.isUpdate,
    required this.review,
  });
}
