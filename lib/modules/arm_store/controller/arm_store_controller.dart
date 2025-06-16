import 'package:flutter/cupertino.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../model/all_arms_list_response.dart';

class ArmStoreController {
  static int pageIndex = 0;
  static int pageCount = 1;
  static int totalArms = 0;
  static final ScrollController scrollController = ScrollController();

  static void listenToScrollChange() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        'here is: ${pageCount}, $totalArms, ${allArms.length}'.log();
        if (allArms.length < totalArms) {
          pageCount = pageCount + 1;

          getAllArms();
        }
      }
    });
  }

  static void setPageIndex(int index) {
    pageIndex = index;
  }

  static List<ArmItem> allArms = [];

  static Future<void> getAllArms() async {
    if (pageCount == 1) {
      ViewUtil.showLoaderPage();
    }
    await ApiClient().request(
      url: AppUrl.allArmsList.url.replaceAll("{PAGE_NO}", "$pageCount"),
      method: Method.GET,
      callback: (response, _) async {
        if (pageCount == 1) {
          ViewUtil.hideLoader();
        }

        if (_) {
          final AllArmsListResponse allArmsListResponse =
              AllArmsListResponse.fromJson(response?.data);
          final arms = allArmsListResponse.data?.arms ?? [];
          totalArms = allArmsListResponse.data?.pagination?.totalRecords ?? 0;
          allArms.addAll(arms);
          await WidgetsBinding.instance.performReassemble();
        }
      },
    );
  }

  static void initialize() {
    pageIndex = 0;
    pageCount = 1;
    totalArms = 0;
    allArms.clear();
    listenToScrollChange();
  }
}
