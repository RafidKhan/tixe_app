import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/my_purchase_history/controller/state/my_purchase_history_state.dart';
import 'package:tixe_flutter_app/modules/my_purchase_history/model/my_pucrahse_history_response.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';
import '../repository/my_purchase_history_interface.dart';
import '../repository/my_purchase_history_repository.dart';

class MyPurchaseHistoryController
    extends StateNotifier<MyPurchaseHistoryState> {
  final IMyPurchaseHistoryRepository _mypurchasehistoryRepository;

  MyPurchaseHistoryController(this._mypurchasehistoryRepository)
      : super(const MyPurchaseHistoryState());

  /// Fetch orders and update state
  Future<void> fetchOrders() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "store/arms/order/list",
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          final resp = MyPurchaseHistoryResponse.fromJson(response?.data);
          state = state.copyWith(orders: resp.data ?? []);
        } else {
          state = state.copyWith(orders: []);
        }
      },
    );
  }
}

/// Riverpod provider
final myPurchaseHistoryController = StateNotifierProvider.autoDispose<
    MyPurchaseHistoryController, MyPurchaseHistoryState>(
  (ref) => MyPurchaseHistoryController(MyPurchaseHistoryRepository()),
);
