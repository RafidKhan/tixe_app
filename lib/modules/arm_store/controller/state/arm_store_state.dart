class ArmStoreState {
  final int pageIndex;

  const ArmStoreState({
    required this.pageIndex,
  });

  ArmStoreState copyWith({int? pageIndex}) {
    return ArmStoreState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
}
