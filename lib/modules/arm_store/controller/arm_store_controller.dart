import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/modules/arm_store/model/slider_arms_list_response.dart';
import 'package:tixe_flutter_app/modules/arm_store/views/components/same_owner_dialog.dart';
import 'package:tixe_flutter_app/modules/list_arms/repository/list_arms_interface.dart';
import 'package:tixe_flutter_app/modules/list_arms/repository/list_arms_repository.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/repository/list_arms_form_interface.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/repository/list_arms_form_repository.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../list_arms_form/model/arms_category_response.dart';
import '../model/all_arms_list_response.dart';

class ArmStoreController {
  //static int pageIndex = 0;
  static int pageCount = 1;
  static int totalArms = 0;
  static num totalCartPrice = 0;
  static final ScrollController scrollController = ScrollController();
  static List<ArmItem> togetherAllArms = [];
  static List<ArmItem> allArms = [];
  static List<ArmItem> sliderArms = [];
  static List<ArmItem> cartItems = [];
  static List<ArmCategory> categories = [];
  static ArmCategory? selectedCategory;

  static void listenToScrollChange() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (allArms.length < totalArms) {
          pageCount = pageCount + 1;

          getAllArms();
        }
      }
    });
  }

  // static void setPageIndex(int index) {
  //   pageIndex = index;
  // }

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
          togetherAllArms.addAll(arms);
          await updateState();
        }
      },
    );
  }

  static Future<void> getSliderArms() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: AppUrl.armsSlideList.url,
      method: Method.GET,
      callback: (response, _) async {
        ViewUtil.hideLoader();
        if (_) {
          final SliderArmsListResponse sliderArmsListResponse =
              SliderArmsListResponse.fromJson(response?.data);
          final arms = sliderArmsListResponse.arms ?? [];
          sliderArms.addAll(arms);
          togetherAllArms.addAll(arms);
          await updateState();
        }
      },
    );
  }

  static void initialize() {
    //pageIndex = 0;
    pageCount = 1;
    totalArms = 0;
    allArms.clear();
    cartItems.clear();
    categories.clear();
    sliderArms.clear();
    togetherAllArms.clear();
    selectedCategory = null;
    totalCartPrice = 0;
    listenToScrollChange();
  }

  static Future<void> getArmsCategories() async {
    final IListArmsFormRepository _listarmsformRepository =
        ListArmsFormRepository();
    categories.clear();
    await _listarmsformRepository.getArmsCategories(
      callback: (response, isSuccess) async {
        categories = response?.data ?? [];
        await updateState();
      },
    );
  }

  static Future<void> updateState() async {
    await WidgetsBinding.instance.performReassemble();
  }

  static void selectCategory(ArmCategory category) async {
    if (selectedCategory?.id == category.id) {
      selectedCategory = null;
    } else {
      selectedCategory = category;
    }
    await updateState();
    Navigation.pop();
  }

  static void addToCard(BuildContext context, int armId) async {
    final arm = togetherAllArms.where((e) => e.id == armId).firstOrNull;

    if (arm != null) {
      final indexInCart = cartItems.indexWhere((e) => e.id == arm.id);
      if (indexInCart < 0) {
        if (togetherAllArms.isNotEmpty) {
          final firstArmOwner = togetherAllArms.firstOrNull?.armOwner?.id;
          if (firstArmOwner != arm.armOwner?.id) {
            showDialog(
              context: context,
              builder: (context) => const SameOwnerDialog(),
            );
            return;
          }
        }

        cartItems.add(arm);
        ViewUtil.snackBar("Added to cart", context);
      } else {
        ViewUtil.snackBar("Already added to cart", context);
      }
      calculateCartTotal();
      await updateState();
    }
  }

  static void calculateCartTotal() async {
    totalCartPrice = cartItems.fold(
        0, (sum, item) => sum + (num.tryParse(item.price ?? "0") ?? 0));
    await updateState();
  }

  static void removeFromCart(ArmItem item) {
    cartItems.removeWhere((e) => e.id == item.id);
    calculateCartTotal();
    updateState();
  }
}
