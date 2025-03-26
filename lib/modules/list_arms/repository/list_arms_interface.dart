import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/list_arms/model/my_arms_response.dart';

@immutable
abstract class IListArmsRepository {
  Future<void> getMyArms({
    required Function(MyArmsResponse? response, bool isSuccess) callback,
  });
}




