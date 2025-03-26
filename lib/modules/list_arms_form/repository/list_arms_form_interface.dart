import 'package:flutter/material.dart';

import '../model/arms_category_response.dart';

@immutable
abstract class IListArmsFormRepository {
  Future<void> getArmsCategories({
    required Function(ArmsCategoryResponse? response, bool isSuccess) callback,
  });
}




