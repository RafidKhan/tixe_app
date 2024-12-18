import 'package:tixe_flutter_app/modules/auth/fitness_details/repository/fitness_details_api.dart';

import '../../../../global/model/global_response.dart';
import '../model/fitness_details_request.dart';
import 'fitness_details_interface.dart';

class FitnessDetailsRepository implements IFitnessDetailsRepository {
  final FitnessDetailsApi _api = FitnessDetailsApi();

  @override
  Future<void> updateRegistrationFitnessDetails({
    required FitnessDetailsRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  }) async {
    await _api.updateRegistrationFitnessDetails(
      params: params.toJson(),
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
