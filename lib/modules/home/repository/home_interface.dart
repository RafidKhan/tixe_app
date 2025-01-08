import 'package:flutter/material.dart';

import '../model/home_data_response.dart';

@immutable
abstract class IHomeRepository {
  Future<void> getHomeData({
    required int page,
    required Function(HomeDataResponse? response, bool isSuccess) callback,
  });
}
