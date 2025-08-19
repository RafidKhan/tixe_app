import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/my_received_orders/model/my_received_orders_response.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../global/widget/global_header_widget.dart';
import '../../../global/widget/global_image_loader.dart';
import '../../../global/widget/scaffold/tixe_main_scaffold.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyReceivedOrdersScreen extends StatefulWidget {
  const MyReceivedOrdersScreen({Key? key}) : super(key: key);

  @override
  State<MyReceivedOrdersScreen> createState() => _MyReceivedOrdersScreenState();
}

class _MyReceivedOrdersScreenState extends State<MyReceivedOrdersScreen> {
  List<MyReceivedOrderData> orders = [];

  getOrder() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "seller/store/arms/order/list",
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          orders = MyReceivedOrdersResponse.fromJson(response?.data).data ?? [];
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      getOrder();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(title: "Received Orders"),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return _item(order);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(MyReceivedOrderData data) {
    return InkWell(
      onTap: () {
        // Navigation.push(
        //   appRoutes: AppRoutes.myPurchaseHistoryDetail,
        //   arguments: data.id,
        // );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1C), // dark background
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order header (ID + Date + Total)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order ID: ${data.id ?? ''}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "\$${data.total?.toStringAsFixed(2) ?? '0.00'}",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 8),

            // Status
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.orange, // you can map to status color
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  data.status ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Items List
            Column(
              children: data.items?.map(
                    (item) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: GlobalImageLoader(
                                imagePath: item.image ?? '',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                imageFor: ImageFor.network,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                item.gearName ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ).toList() ??
                  [],
            ),
          ],
        ),
      ),
    );
  }
}
