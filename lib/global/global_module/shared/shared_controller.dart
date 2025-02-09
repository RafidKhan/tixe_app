import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_state.dart';
import 'package:tixe_flutter_app/utils/user_activity_tracker_services/user_activity_tracker_services.dart';

final sharedController = StateNotifierProvider<SharedController, SharedState>(
  (ref) => SharedController(),
);

class SharedController extends StateNotifier<SharedState> {
  SharedController()
      : super(
          const SharedState(
            isHealthConnectSynced: false,
          ),
        );

  Future<void> checkIsHealthConnectSynced() async {
    state = state.copyWith(
      isHealthConnectSynced: UserActivityTrack.isSyncedWithTracker(),
    );
  }

  Future<void> fetchFitnessData() async{
    await UserActivityTrack.fetchAllData();
  }
}
