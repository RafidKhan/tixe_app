import '../model/home_data_response.dart';
import 'home_api.dart';
import 'home_interface.dart';

class HomeRepository implements IHomeRepository {
  final HomeApi _api = HomeApi();

  @override
  Future<void> getHomeData({
    required int page,
    required Function(HomeDataResponse? response, bool isSuccess) callback,
  }) async {
    await _api.getHomeData(
      page: page,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? HomeDataResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
