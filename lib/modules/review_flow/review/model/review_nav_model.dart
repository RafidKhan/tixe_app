import 'package:tixe_flutter_app/global/model/review_model.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

class ReviewNavModel {
  final int? id;
  final num averageRating;
  final int totalRatings;
  final ServiceType serviceType;
  final List<ReviewModel> reviews;

  const ReviewNavModel({
    required this.id,
    required this.averageRating,
    required this.totalRatings,
    required this.serviceType,
    required this.reviews,
  });
}
