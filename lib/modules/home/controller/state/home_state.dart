import 'package:tixe_flutter_app/modules/home/model/home_data_response.dart';

class HomeState {
  final bool isLoading;
  final bool isLoadingMore;
  final List<HomeDataItem> homeDataList;
  final int page;
  final int totalDataSize;

  const HomeState({
    required this.isLoading,
    required this.isLoadingMore,
    required this.homeDataList,
    required this.page,
    required this.totalDataSize,
  });

  HomeState copyWith({
    bool? isLoading,
    bool? isLoadingMore,
    List<HomeDataItem>? homeDataList,
    int? page,
    int? totalDataSize,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      homeDataList: homeDataList ?? this.homeDataList,
      page: page ?? this.page,
      totalDataSize: totalDataSize ?? this.totalDataSize,
    );
  }
}
