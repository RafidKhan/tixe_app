import 'package:tixe_flutter_app/global/model/settings_response.dart';

abstract class IGlobalRepository {
  Future<void> getSettingsData({
    required Function(SettingsResponse? response, bool isSuccess) callback,
  });
}
