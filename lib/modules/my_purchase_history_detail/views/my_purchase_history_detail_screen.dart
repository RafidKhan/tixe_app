import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../model/order_detail_response.dart';
import 'package:flutter/material.dart';

class MyPurchaseHistoryDetailScreen extends StatefulWidget {
  final int id;

  const MyPurchaseHistoryDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MyPurchaseHistoryDetailScreen> createState() =>
      _MyPurchaseHistoryDetailScreenState();
}

class _MyPurchaseHistoryDetailScreenState
    extends State<MyPurchaseHistoryDetailScreen> {
  OrderDetailData? data;

  @override
  void initState() {
    super.initState();
    Future(() {
      getData();
    });
  }

  getData() async {
    ViewUtil.showLoaderPage();
    ApiClient().request(
      url: "store/arms/order/${widget.id}/details",
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          data = OrderDetailResponse.fromJson(response?.data).data;
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: data == null
          ? const SizedBox() // loader handled by ViewUtil
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlobalHeaderWidget(title: "Order Details"),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        // Order ID + Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order ID: ${data?.id ?? ''}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Order Date: ${DateFormat("dd MMM yyyy").format(DateTime.parse(data?.date ?? ''))}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),

                        // Status
                        Row(
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              data?.status ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Items
                        Column(
                          children: data?.items?.map((item) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 12),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E1E1C),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: GlobalImageLoader(
                                          imagePath: item.image ?? '',
                                          width: 60,
                                          height: 60,
                                          fit: BoxFit.cover,
                                          imageFor: ImageFor.network,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.gearName ?? '',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.h,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 6),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Text(
                                                "\$${item.gearPrice ?? '0.00'}",
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList() ??
                              [],
                        ),

                        const SizedBox(height: 12),

                        // Price Summary
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _priceRow("Total", "\$${data?.total ?? '0.00'}"),
                            _priceRow("Shipping",
                                "\$${data?.shippingCharge ?? '0.00'}"),
                            _priceRow(
                                "Discount", "-\$${data?.discount ?? '0.00'}"),
                            const Divider(color: Colors.grey),
                            Center(
                              child: Column(
                                children: [
                                  const Text(
                                    "Grand Total",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "\$${data?.grandTotal ?? '0'}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        // Shipping Address
                        Align(
                          alignment: Alignment.topLeft,
                          child: _addressSection(
                              "Shipping Address", data?.shippingDetails),
                        ),

                        const SizedBox(height: 20),

                        // Billing Address
                        Align(
                          alignment: Alignment.topLeft,
                          child: _addressSection(
                              "Billing Address", data?.billingDetails),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Widget _priceRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _addressSection(String title, AddressDetail? address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        if (address != null) ...[
          Text(address.name ?? '', style: const TextStyle(color: Colors.white)),
          Text(address.phone ?? '',
              style: const TextStyle(color: Colors.white)),
          Text(address.email ?? '',
              style: const TextStyle(color: Colors.white)),
          Text(
            "${address.addressLine ?? ''}, ${address.city?.cityName ?? ''}, ${address.state?.stateName ?? ''}, ${address.country ?? ''}",
            style: const TextStyle(color: Colors.white),
          ),
        ]
      ],
    );
  }
}
