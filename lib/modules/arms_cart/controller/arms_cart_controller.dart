import 'package:flutter/material.dart';

import '../repository/arms_cart_interface.dart';
import '../repository/arms_cart_repository.dart';

class ArmsCartController {
  //final IArmsCartRepository _armscartRepository = ArmsCartRepository();
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

  static bool sameAsShipping = true;

  static Future<void> updateState() async {
    await WidgetsBinding.instance.performReassemble();
  }

  static void toggleSameAddress() {
    sameAsShipping = !sameAsShipping;

    onTextChange();

    updateState();
  }

  static void init() {
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
    listenToTextChange();
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

  static void onTextChange(){
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

}
