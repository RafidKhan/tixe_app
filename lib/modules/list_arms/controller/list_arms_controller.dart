import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/list_arms/controller/state/list_arms_state.dart';
import 'package:tixe_flutter_app/modules/list_arms/model/my_listed_arms_model.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../repository/list_arms_interface.dart';
import '../repository/list_arms_repository.dart';

final listArmsControllerProvider =
    StateNotifierProvider.autoDispose<ListArmsController, ListArmsState>((ref) {
  return ListArmsController();
});

class ListArmsController extends StateNotifier<ListArmsState> {
  final IListArmsRepository _listarmsRepository = ListArmsRepository();

  ListArmsController()
      : super(
          const ListArmsState(
            arms: [],
          ),
        );

  Future<void> getArms() async {
    ViewUtil.showLoaderPage();
    await _listarmsRepository.getMyArms(
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final arms = response?.data ?? [];
          state = state.copyWith(
            arms: arms.map((e) {
              e.toJson().log();
              return MyListedArm(
                title: e.title ?? "",
                description: e.description ?? "",
                price: e.price ?? "",
                renting: e.rentalOption == "1",
                image: e.featureImage ?? "",
              );
            }).toList(),
          );
        }
      },
    );

    // state = state.copyWith(
    //   arms: [
    //     MyListedArm(
    //       title: "Pistol 24M",
    //       description:
    //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis faucibus mi non egestas efficitur. Etiam molestie lectus et rutrum finibus.",
    //       price: "125.00",
    //       renting: true,
    //       image: KAssetName.dummyGearPng.imagePath,
    //     ),
    //     MyListedArm(
    //       title: "AK 47",
    //       description:
    //           "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis faucibus mi non egestas efficitur. Etiam molestie lectus et rutrum finibus.",
    //       price: "500.00",
    //       renting: false,
    //       image: KAssetName.dummyGearPng.imagePath,
    //     ),
    //   ],
    // );
  }
}
