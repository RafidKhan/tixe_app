import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/home/controller/state/home_state.dart';

import '../repository/home_interface.dart';
import '../repository/home_repository.dart';

final homeController =
    StateNotifierProvider<HomeController, HomeState>((ref) => HomeController());

class HomeController extends StateNotifier<HomeState> {
  final IHomeRepository _homeRepository = HomeRepository();

  final ScrollController scrollController = ScrollController();

  HomeController()
      : super(
          const HomeState(
            isLoading: false,
            isLoadingMore: false,
            homeDataList: [],
            page: 1,
            totalDataSize: 0,
          ),
        );

  Future<void> callApi() async {
    initialize();
    await loadHomeData();
    listenToPagination();
  }

  listenToPagination() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (state.homeDataList.length < state.totalDataSize) {
          loadMoreHomeData();
        }
      }
    });
  }

  void initialize() {
    state = state.copyWith(
      isLoading: false,
      isLoadingMore: false,
      homeDataList: [],
      page: 1,
      totalDataSize: 0,
    );
  }

  Future<void> loadHomeData() async {
    state = state.copyWith(isLoading: true);
    await _homeRepository.getHomeData(
      page: state.page,
      callback: (response, isSuccess) {
        state = state.copyWith(
          isLoading: false,
          homeDataList: response?.data?.services ?? [],
          page: state.page + 1,
          totalDataSize: response?.data?.pagination?.totalRecords ?? 0,
        );
      },
    );
  }

  Future<void> loadMoreHomeData() async {
    state = state.copyWith(isLoadingMore: true);

    await _homeRepository.getHomeData(
      page: state.page,
      callback: (response, isSuccess) {
        final dataList = response?.data?.services ?? [];
        final existingList = state.homeDataList;
        final newList = existingList + dataList;
        state = state.copyWith(
          isLoadingMore: false,
          homeDataList: newList,
          page: state.page + 1,
        );
      },
    );
  }
}
