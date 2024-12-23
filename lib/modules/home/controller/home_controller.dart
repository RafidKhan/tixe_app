import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/home/controller/state/home_state.dart';

import '../repository/home_interface.dart';
import '../repository/home_repository.dart';

final homeController =
    StateNotifierProvider<HomeController, HomeState>((ref) => HomeController());

class HomeController extends StateNotifier<HomeState> {
  final IHomeRepository _homeRepository = HomeRepository();

  HomeController()
      : super(
          const HomeState(
            isLoading: false,
            homeDataList: [],
            page: 1,
          ),
        );

  Future<void> callApi() async {
    initialize();
    await loadHomeData();
  }

  void initialize() {
    state = state.copyWith(
      isLoading: false,
      homeDataList: [],
      page: 1,
    );
  }

  Future<void> loadHomeData() async {
    state = state.copyWith(isLoading: true);
    await _homeRepository.getHomeData(
      page: state.page,
      callback: (response, isSuccess) {
        state = state.copyWith(isLoading: false);
      },
    );
  }
}
