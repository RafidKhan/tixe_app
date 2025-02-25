import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/state/arm_store_state.dart';

import '../repository/arm_store_interface.dart';
import '../repository/arm_store_repository.dart';

final armStoreController =
    StateNotifierProvider.autoDispose<ArmStoreController, ArmStoreState>(
        (ref) => ArmStoreController());

class ArmStoreController extends StateNotifier<ArmStoreState> {
  final IArmStoreRepository _armstoreRepository = ArmStoreRepository();

  ArmStoreController()
      : super(
          const ArmStoreState(
            pageIndex: 0,
          ),
        );

  void setPageIndex(int index) {
    state = state.copyWith(pageIndex: index);
  }
}
