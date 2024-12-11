import 'package:flutter/material.dart';

enum KColor {
  primary,
  black,
  white,
  btnGradient1,
  btnGradient2,
  bodyGradient1,
  bodyGradient2,
  transparent,
  grey,
  disabledBtnColor,
}

extension KColorExtention on KColor {
  Color get color {
    switch (this) {
      case KColor.primary:
        return const Color(0xff121106);
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
    }
  }
}
