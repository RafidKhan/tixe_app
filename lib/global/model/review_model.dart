class ReviewModel{
  final int? reviewId;
  final int? userId;
  final String userImage;
  final String userName;
  final num rating;
  final String comment;

  const ReviewModel({
    required this.reviewId,
    required this.userId,
    required this.userImage,
    required this.userName,
    required this.rating,
    required this.comment,
});
}