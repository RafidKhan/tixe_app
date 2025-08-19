import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/arms_details/model/store_arm_detail.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

class ArmsDetailsController {
  static GearDetailData? details;

  static Future<void> updateState() async {
    await WidgetsBinding.instance.performReassemble();
  }

  static Future<void> getDetails(int id) async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "arms/$id/details",
      method: Method.GET,
      callback: (response, success) async {
        ViewUtil.hideLoader();
        final StoreArmDetail storeArmDetail =
            StoreArmDetail.fromJson(response?.data);
        details = storeArmDetail.data;
        await updateState();
      },
    );
  }
}
