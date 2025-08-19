import 'package:tixe_flutter_app/modules/my_purchase_history/model/my_pucrahse_history_response.dart';

class MyPurchaseHistoryState {
  final List<MyOrderData> orders;

  const MyPurchaseHistoryState({
    this.orders = const [],
  });

  MyPurchaseHistoryState copyWith({
    List<MyOrderData>? orders,
  }) {
    return MyPurchaseHistoryState(
      orders: orders ?? this.orders,
    );
  }
}
