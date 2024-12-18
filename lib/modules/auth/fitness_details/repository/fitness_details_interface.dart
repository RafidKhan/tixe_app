import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';

import '../model/fitness_details_request.dart';

@immutable
abstract class IFitnessDetailsRepository {
  Future<void> updateRegistrationFitnessDetails({
    required FitnessDetailsRequest params,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });
}
