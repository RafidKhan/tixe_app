class HomeState {
  final bool isLoading;
  final List<dynamic> homeDataList;
  final int page;

  const HomeState({
    required this.isLoading,
    required this.homeDataList,
    required this.page,
  });

  HomeState copyWith({
    bool? isLoading,
    List<dynamic>? homeDataList,
    int? page,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      homeDataList: homeDataList ?? this.homeDataList,
      page: page ?? this.page,
    );
  }
}
