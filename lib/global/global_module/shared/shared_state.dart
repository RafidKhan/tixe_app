class SharedState {
  final bool isHealthConnectSynced;

  const SharedState({
    required this.isHealthConnectSynced,
  });

  SharedState copyWith({
    bool? isHealthConnectSynced,
  }) {
    return SharedState(
      isHealthConnectSynced: isHealthConnectSynced ?? this.isHealthConnectSynced,
    );
  }
}