import 'package:tixe_flutter_app/modules/list_arms_form/repository/list_arms_form_api.dart';

import '../model/arms_category_response.dart';
import 'list_arms_form_interface.dart';

class ListArmsFormRepository implements IListArmsFormRepository {
  final ListArmsFormApi _api = ListArmsFormApi();

  @override
  Future<void> getArmsCategories({
    required Function(ArmsCategoryResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getArmsCategories(
      callback: (response, isSuccess) {
        callback(
          isSuccess ? ArmsCategoryResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
