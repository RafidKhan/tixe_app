import 'package:flutter/material.dart';

enum KColor {
  primary,
  secondary,
  black,
  white,
  btnGradient1,
  btnGradient2,
  bodyGradient1,
  bodyGradient2,
  transparent,
  grey,
  liteGrey,
  darkGrey,
  darkGrey2,
  disabledBtnColor,
  shadeGradient1,
  shadeGradient2,
  cardGradient1,
  cardGradient2,
  green,
  red,
  workoutColor,
  stepsColor,
  calorieColor,
  exerciseColor,
}

extension KColorExtention on KColor {
  Color get color {
    switch (this) {
      case KColor.primary:
        return const Color(0xff121106);
      case KColor.secondary:
        return const Color(0xffF8BA1C);
      case KColor.black:
        return Colors.black;
      case KColor.white:
        return Colors.white;
      case KColor.btnGradient1:
        return const Color(0xffE1CB02);
      case KColor.btnGradient2:
        return const Color(0xffD1B41B);
      case KColor.bodyGradient1:
        return const Color(0xff272408);
      case KColor.bodyGradient2:
        return const Color(0xff161A22);
      case KColor.transparent:
        return Colors.transparent;
      case KColor.grey:
        return const Color(0xffC3C5CA);
      case KColor.disabledBtnColor:
        return const Color(0xffE2CB02).withOpacity(0.3);
      case KColor.shadeGradient1:
        return const Color(0xff575548);
      case KColor.shadeGradient2:
        return const Color(0xff24231F);
      case KColor.cardGradient1:
        return const Color(0xff444339);
      case KColor.cardGradient2:
        return const Color(0xff44433C);
      case KColor.green:
        return const Color(0xff01B469);
      case KColor.liteGrey:
        return const Color(0xff6C6B68);
      case KColor.darkGrey:
        return const Color(0xff2E2D21);
      case KColor.darkGrey2:
        return const Color(0xff222118);
      case KColor.red:
        return Colors.red;
      case KColor.workoutColor:
        return const Color(0xffD8FFBA);
      case KColor.stepsColor:
        return const Color(0xff7593FE);
      case KColor.calorieColor:
        return const Color(0xffFFAB48);
      case KColor.exerciseColor:
        return const Color(0xff10CB71);
    }
  }
}
