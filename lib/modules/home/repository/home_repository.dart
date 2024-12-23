import 'package:tixe_flutter_app/global/model/global_response.dart';

import 'home_api.dart';
import 'home_interface.dart';

class HomeRepository implements IHomeRepository {
  final HomeApi _api = HomeApi();

  @override
  Future<void> getHomeData({
    required int page,
    required Function(GlobalResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getHomeData(
      page: page,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? GlobalResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
