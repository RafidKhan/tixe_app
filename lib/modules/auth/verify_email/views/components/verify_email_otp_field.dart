import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:tixe_app/utils/extension.dart';

import '../../../../../utils/styles/k_colors.dart';
import '../../controller/verify_email_controller.dart';

class VerifyEmailOtpField extends StatelessWidget {
  const VerifyEmailOtpField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read(verifyEmailController.notifier);
    final defaultPinTheme = PinTheme(
      width: context.width,
      height: 54.h,
      textStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: KColor.black.color,
      ),
      decoration: BoxDecoration(
        color: KColor.white.color,
        borderRadius: BorderRadius.circular(16.r),
      ),
    );
    return Pinput(
      autofillHints: null,
      controller: controller.otpController,
      showCursor: false,
      length: 6,
      keyboardType: const TextInputType.numberWithOptions(),
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: KColor.btnGradient1.color),
        ),
      ),
      submittedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: KColor.btnGradient1.color),
        ),
      ),
      errorPinTheme: defaultPinTheme,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      animationDuration: const Duration(milliseconds: 300),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
    );
  }
}
