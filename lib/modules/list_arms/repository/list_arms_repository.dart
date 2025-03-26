import 'package:tixe_flutter_app/modules/list_arms/repository/list_arms_api.dart';

import '../model/my_arms_response.dart';
import 'list_arms_interface.dart';

class ListArmsRepository implements IListArmsRepository {

  final ListArmsApi _api = ListArmsApi();

  @override
  Future<void> getMyArms({
    required Function(MyArmsResponse? response, bool isSuccess) callback,
  }) async{
    await _api.getMyArms(
      callback: (response, isSuccess) {
        callback(isSuccess?MyArmsResponse.fromJson(response?.data):null, isSuccess);
      },
    );
  }
}



