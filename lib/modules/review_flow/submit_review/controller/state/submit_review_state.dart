class SubmitReviewState{
  final List<bool> starStatusList;
  final bool isButtonEnabled;

  const SubmitReviewState({
    required this.starStatusList,
    required this.isButtonEnabled,
  });

  SubmitReviewState copyWith({
    List<bool>? starStatusList,
    bool? isButtonEnabled,
  }) {
    return SubmitReviewState(
      starStatusList: starStatusList ?? this.starStatusList,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
    );
  }
}