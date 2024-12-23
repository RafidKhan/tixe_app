import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';

@immutable
abstract class IHomeRepository {
  Future<void> getHomeData({
    required int page,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  });
}




