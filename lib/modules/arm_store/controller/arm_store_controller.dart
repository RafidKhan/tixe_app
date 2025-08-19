import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/model/global_response.dart';
import 'package:tixe_flutter_app/modules/arm_store/model/slider_arms_list_response.dart';
import 'package:tixe_flutter_app/modules/arm_store/views/components/same_owner_dialog.dart';
import 'package:tixe_flutter_app/modules/cart_address/model/state_list_response.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/repository/list_arms_form_interface.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/repository/list_arms_form_repository.dart';
import 'package:tixe_flutter_app/modules/listing_payment/model/listing_payment_nav_model.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../utils/app_routes.dart';
import '../../cart_address/model/city_list_response.dart';
import '../../list_arms_form/model/arms_category_response.dart';
import '../model/all_arms_list_response.dart';
import '../model/arm_order_create_response.dart';
import '../model/arm_store_dicsount_response.dart';

class ArmStoreController {
  //static int pageIndex = 0;
  static int pageCount = 1;
  static int totalArms = 0;

  static final ScrollController scrollController = ScrollController();
  static List<ArmItem> togetherAllArms = [];
  static List<ArmItem> allArms = [];
  static List<ArmItem> sliderArms = [];
  static List<ArmItem> cartItems = [];
  static List<ArmCategory> categories = [];
  static ArmCategory? selectedCategory;

  static final TextEditingController code = TextEditingController();

  static final TextEditingController shippingName = TextEditingController();
  static final TextEditingController shippingAddress = TextEditingController();
  static final TextEditingController shippingState = TextEditingController();
  static final TextEditingController shippingCountry = TextEditingController();
  static final TextEditingController shippingCity = TextEditingController();
  static final TextEditingController sippingEmail = TextEditingController();
  static final TextEditingController sippingMobile = TextEditingController();

  static final TextEditingController billingName = TextEditingController();
  static final TextEditingController billingAddress = TextEditingController();
  static final TextEditingController billingState = TextEditingController();
  static final TextEditingController billingCountry = TextEditingController();
  static final TextEditingController billingCity = TextEditingController();
  static final TextEditingController billingEmail = TextEditingController();
  static final TextEditingController billingMobile = TextEditingController();

  static num totalCartPrice = 0;
  static num grandTotal = 0;
  static bool sameAsShipping = true;
  static String shippingCharge = "0";
  static String discountAmount = "0";
  static List<StateData> states = [];
  static StateData? selectedShippingState;
  static StateData? selectedBillingState;
  static List<CityData> citiesForShipping = [];
  static List<CityData> citiesForBilling = [];
  static CityData? selectedShippingCity;
  static CityData? selectedBillingCity;
  static int orderId = -1;

  static Future<void> updateState() async {
    await WidgetsBinding.instance.performReassemble();
  }

  static void toggleSameAddress() {
    sameAsShipping = !sameAsShipping;

    onTextChange();

    updateState();
  }

  static void listenToTextChange() {
    shippingName.addListener(onTextChange);
    shippingAddress.addListener(onTextChange);
    shippingState.addListener(onTextChange);
    shippingCountry.addListener(onTextChange);
    shippingCity.addListener(onTextChange);
    sippingEmail.addListener(onTextChange);
    sippingMobile.addListener(onTextChange);
  }

  static void onTextChange() {
    if (sameAsShipping) {
      billingName.text = shippingName.text;
      billingAddress.text = shippingAddress.text;
      billingState.text = shippingState.text;
      billingCountry.text = shippingCountry.text;
      billingCity.text = shippingCity.text;
      billingEmail.text = sippingEmail.text;
      billingMobile.text = sippingMobile.text;
    } else {
      billingName.clear();
      billingAddress.clear();
      billingState.clear();
      billingCountry.clear();
      billingCity.clear();
      billingEmail.clear();
      billingMobile.clear();
    }
  }

  static void calculateCartTotal() async {
    totalCartPrice = cartItems.fold(
        0, (sum, item) => sum + (num.tryParse(item.price ?? "0") ?? 0));
    final num shippingChargeValue = num.tryParse(shippingCharge) ?? 0;
    final discountValue = num.tryParse(discountAmount) ?? 0;
    grandTotal = totalCartPrice + shippingChargeValue - discountValue;

    await updateState();
  }

  static Future<void> applyDiscountCode() async {
    if (code.text.trim().isEmpty) {
      ViewUtil.snackBar(
          "Please enter discount code", Navigation.key.currentContext!);
      return;
    }
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "store/arms/discount-code/verify",
      method: Method.POST,
      params: {
        "discount_code": code.text.trim(),
        "order_id": orderId,
      },
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          final ArmStoreDiscountResponse armStoreDiscountResponse =
              ArmStoreDiscountResponse.fromJson(response?.data);
          discountAmount = armStoreDiscountResponse.data?.discountAmount ?? "0";
          calculateCartTotal();
        }
      },
    );
  }

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
    //category_id
    String url = AppUrl.allArmsList.url.replaceAll("{PAGE_NO}", "$pageCount");
    if (selectedCategory != null) {
      url = "$url&category_id=${selectedCategory?.id}";
    }
    await ApiClient().request(
      url: url,
      method: Method.GET,
      callback: (response, _) async {
        if (pageCount == 1) {
          ViewUtil.hideLoader();
        }

        if (_) {
          final AllArmsListResponse allArmsListResponse =
              AllArmsListResponse.fromJson(response?.data);
          var arms = allArmsListResponse.data?.arms ?? [];
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
    shippingName.clear();
    shippingAddress.clear();
    shippingState.clear();
    shippingCountry.clear();
    shippingCity.clear();
    sippingEmail.clear();
    sippingMobile.clear();

    billingName.clear();
    billingAddress.clear();
    billingState.clear();
    billingCountry.clear();
    billingCity.clear();
    billingEmail.clear();
    billingMobile.clear();

    sameAsShipping = true;
    totalCartPrice = 0;
    shippingCharge = "0";
    discountAmount = "0";
    grandTotal = 0;
    states.clear();
    selectedShippingState = null;
    selectedBillingState = null;
    citiesForShipping.clear();
    citiesForBilling.clear();
    selectedShippingCity = null;
    selectedBillingCity = null;
    orderId = -1;
    listenToTextChange();
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

  static void selectCategory(ArmCategory category) async {
    if (selectedCategory?.id == category.id) {
      selectedCategory = null;
    } else {
      selectedCategory = category;
    }
    pageCount = 1;
    await updateState();
    await getAllArms();
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

  static void removeFromCart(ArmItem item) {
    cartItems.removeWhere((e) => e.id == item.id);
    calculateCartTotal();
    updateState();
  }

  static void fetchStates() async {
    selectedShippingState = null;
    selectedBillingState = null;
    selectedShippingCity = null;
    selectedBillingCity = null;
    shippingState.clear();
    shippingCity.clear();
    billingState.clear();
    billingCity.clear();
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "store/all/states",
      method: Method.GET,
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final StateListResponse stateListResponse =
              StateListResponse.fromJson(response?.data);
          states = stateListResponse.data ?? [];
          updateState();
        }
      },
    );
  }

  static void fetchCities(
    int stateId, {
    required Function(List<CityData> cities) onResponse,
  }) async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "store/state/$stateId/cities",
      method: Method.GET,
      callback: (response, isSuccess) {
        ViewUtil.hideLoader();
        if (isSuccess) {
          final CityListResponse cityListResponse =
              CityListResponse.fromJson(response?.data);
          onResponse(cityListResponse.data ?? []);
        }
      },
    );
  }

  static void selectShippingState(StateData state) async {
    if (selectedShippingState?.id == state.id) {
      selectedShippingState = null;
    } else {
      selectedShippingState = state;
      selectedShippingCity = null; // Reset city when state changes
      shippingCity.clear();
      fetchCities(state.id ?? -1, onResponse: (cities) {
        citiesForShipping = cities;
        shippingCity.text = "";
        selectedShippingCity = null;
        updateState();
      }); // Fetch cities for the selected state
    }
    shippingState.text = selectedShippingState?.stateName ?? "";
    if (sameAsShipping) {
      selectedBillingState = selectedShippingState;
    }

    await updateState();
  }

  static void selectShippingCity(CityData city) async {
    if (selectedShippingCity?.id == city.id) {
      selectedShippingCity = null;
    } else {
      selectedShippingCity = city;
    }
    shippingCity.text = selectedShippingCity?.cityName ?? "";
    shippingCharge = selectedShippingCity?.shippingCharge ?? "0";
    calculateCartTotal();
    if (sameAsShipping) {
      selectedBillingCity = selectedShippingCity;
    }
    await updateState();
  }

  static void selectBillingState(StateData state) {
    billingState.text = state.stateName ?? "";
    billingCity.clear();
    billingCity.text = "";
    selectedBillingState = state;
    ArmStoreController.fetchCities(state.id ?? -1, onResponse: (cities) {
      citiesForBilling = cities;
      selectedBillingCity = null; // Reset city when state changes
      updateState();
    });
  }

  static void selectBillingCity(CityData city) {
    billingCity.text = city.cityName ?? "";
    selectedBillingCity = city;
    updateState();
  }

  static Future<void> createInitialOrder(BuildContext context) async {
    //return if shipping and billing details are not filled
    if (shippingName.text.isEmpty ||
        shippingAddress.text.isEmpty ||
        shippingState.text.isEmpty ||
        shippingCountry.text.isEmpty ||
        shippingCity.text.isEmpty ||
        sippingEmail.text.isEmpty ||
        sippingMobile.text.isEmpty ||
        billingName.text.isEmpty ||
        billingAddress.text.isEmpty ||
        billingState.text.isEmpty ||
        billingCountry.text.isEmpty ||
        billingCity.text.isEmpty ||
        billingEmail.text.isEmpty ||
        billingMobile.text.isEmpty ||
        cartItems.isEmpty) {
      ViewUtil.snackBar(
          "Please fill all shipping and billing details", context);
      return;
    }
    ViewUtil.showLoaderPage();
    final params = {
      "gears": cartItems
          .map((item) => {
                "gear_id": item.id,
                "quantity": 1,
              })
          .toList(),
      "subtotal": grandTotal,
      "total": grandTotal
    };
    await ApiClient().request(
      url: "store/arms/order-placed",
      method: Method.POST,
      params: params,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          final ArmOrderCreateResponse armOrderCreateResponse =
              ArmOrderCreateResponse.fromJson(response?.data);
          orderId = armOrderCreateResponse.order?.id ?? -1;
          Future.delayed(Duration(milliseconds: 100), () async {
            await createShippingAddress(context);
          });
        }
      },
    );
  }

  static Future<void> createShippingAddress(BuildContext context) async {
    final params = {
      "name": shippingName.text.trim(),
      "order_id": orderId,
      "email": sippingEmail.text.trim(),
      "phone": sippingMobile.text.trim(),
      "address_line": shippingAddress.text.trim(),
      "city_id": selectedShippingCity?.id ?? -1,
      "state_id": selectedShippingState?.id ?? -1,
      "postal_code": "",
      "country": shippingCountry.text.trim(),
      "type": "shipping",
    };
    'here is: ${params}'.log();
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "store/arms/shipping-billing-address",
      method: Method.POST,
      params: params,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          Future.delayed(Duration(milliseconds: 100), () async {
            await createBillingAddress(context);
          });
        }
      },
    );
  }

  static Future<void> createBillingAddress(BuildContext context) async {
    final params = {
      "name": billingName.text.trim(),
      "order_id": orderId,
      "email": billingEmail.text.trim(),
      "phone": billingMobile.text.trim(),
      "address_line": billingAddress.text.trim(),
      "city_id": selectedBillingCity?.id ?? -1,
      "state_id": selectedBillingState?.id ?? -1,
      "postal_code": "",
      "country": billingCountry.text.trim(),
      "type": "billing",
    };
    'here is:2: ${params}'.log();
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "store/arms/shipping-billing-address",
      method: Method.POST,
      params: params,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          Future.delayed(Duration(milliseconds: 100), () async {
            Navigation.push(appRoutes: AppRoutes.armsPayment);
          });
        }
      },
    );
  }

  static Future<void> confirmPayment(BuildContext context) async {
    ViewUtil.showLoaderPage();
    final params = {
      "amount": grandTotal,
      "order_id": orderId,
      "status": "pending",
      "transaction_id": "123123",
    };
    await ApiClient().request(
      url: "payment",
      params: params,
      method: Method.POST,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          final GlobalResponse globalResponse =
              GlobalResponse.fromJson(response?.data);
          Navigation.pushAndRemoveUntil(
            appRoutes: AppRoutes.paymentSuccess,
            arguments: const ListingPaymentNavModel(
              type: ListingType.Arms,
              subTitle:
                  "Your payment has been received. Your Order will be delivered to you soon",
            ),
          );
        }
      },
    );
  }
}
