import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../utils/styles/k_colors.dart';
import '../../controller/verify_email_controller.dart';

class VerifyEmailResendOtp extends ConsumerWidget {
  const VerifyEmailResendOtp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(verifyEmailController);
    final controller = ref.read(verifyEmailController.notifier);

    return Row(
      children: [
        GlobalText(
          str: state.leftTime,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: KColor.white.color,
        ),
        const Spacer(),
        InkWell(
          onTap: state.showResendOtpButton
              ? () {
                  controller.startTimer();
                }
              : null,
          child: GlobalText(
            str: context.loc.resend,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: state.showResendOtpButton
                ? KColor.btnGradient1.color
                : KColor.disabledBtnColor.color,
          ),
        ),
      ],
    );
  }
}
