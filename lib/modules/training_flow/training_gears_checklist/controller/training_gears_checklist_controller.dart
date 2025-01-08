import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/controller/state/training_gears_checklist_state.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/custom_gear_data.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../model/training_gears_checklist_nav_model.dart';
import '../repository/training_gears_checklist_interface.dart';
import '../repository/training_gears_checklist_repository.dart';

final trainingGearsChecklistController = StateNotifierProvider.autoDispose<
    TrainingGearsChecklistController,
    TrainingGearsChecklistState>((ref) => TrainingGearsChecklistController());

class TrainingGearsChecklistController
    extends StateNotifier<TrainingGearsChecklistState> {
  final ITrainingGearsChecklistRepository _traininggearschecklistRepository =
      TrainingGearsChecklistRepository();

  TrainingGearsChecklistController()
      : super(
          const TrainingGearsChecklistState(
            model: null,
            allGears: [],
            selectedGears: [],
            isButtonEnabled: false,
          ),
        );

  void setModel(TrainingGearsChecklistNavModel model) {
    state = state.copyWith(model: model);
    getGears();
  }

  Future<void> getGears() async {
    ViewUtil.showLoaderPage();
    await _traininggearschecklistRepository.getGears(
      trainingId: (state.model?.trainingDetail?.id ?? "").toString(),
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          final gears = response?.data ?? [];
          if (gears.isNotEmpty) {
            final List<CustomGearData> customGears = [];
            for (var e in gears) {
              customGears.add(
                CustomGearData(
                    id: e.id,
                    name: e.name,
                    image: e.image,
                    buyingPrice: e.price,
                    rentPrice: e.rentPrice,
                    selection: null),
              );
            }
            state = state.copyWith(allGears: customGears);
          }
        }
      },
    );
  }

  void onOptionSelected(
      {required CustomGearData gear, required GearSelection option}) {}

  void selectGear(CustomGearData gear, GearSelection option) {
    final allGears = state.allGears;
    final List<CustomGearData> selectedGears = [];
    for (var e in allGears) {
      if (e.id == gear.id) {
        e.selection = option;
      }
    }
    for (var e in allGears) {
      if (e.selection != null) {
        selectedGears.add(e);
      }
    }
    state = state.copyWith(allGears: allGears, selectedGears: selectedGears);
    checkButtonStatus();
  }

  void checkButtonStatus() {
    state = state.copyWith(isButtonEnabled: state.selectedGears.isNotEmpty);
  }
}
