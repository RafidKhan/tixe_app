import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../controller/my_purchase_history_controller.dart';
import '../model/my_pucrahse_history_response.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyPurchaseHistoryScreen extends StatefulWidget {
  const MyPurchaseHistoryScreen({super.key});

  @override
  State<MyPurchaseHistoryScreen> createState() =>
      _MyPurchaseHistoryScreenState();
}

class _MyPurchaseHistoryScreenState extends State<MyPurchaseHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      final controller = context.read(myPurchaseHistoryController.notifier);
      controller.fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final controller = ref.read(myPurchaseHistoryController.notifier);
      final state = ref.watch(myPurchaseHistoryController);
      return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const GlobalHeaderWidget(title: "My Purchase History"),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: state.orders.length,
                itemBuilder: (context, index) {
                  final order = state.orders[index];
                  return _item(order);
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _item(MyOrderData data) {
    return Container(
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
    );
  }
}
