import 'dart:convert';

import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../repository/training_gears_checklist_interface.dart';
import '../repository/training_gears_checklist_repository.dart';

class TrainingGearsChecklistController {
  final ITrainingGearsChecklistRepository _traininggearschecklistRepository =
      TrainingGearsChecklistRepository();

  Future<void> getGears() async {
    ViewUtil.showLoaderPage();
    await _traininggearschecklistRepository.getGears(
      callback: (response, success) {
        ViewUtil.hideLoader();
        'response:: ${jsonEncode(response?.data)}'.log();
      },
    );
  }
}
