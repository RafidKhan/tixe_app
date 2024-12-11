import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_app/global/widget/global_button.dart';
import 'package:tixe_app/global/widget/tixe_scaffold.dart';
import 'package:tixe_app/modules/auth/verify_email/controller/verify_email_controller.dart';
import 'package:tixe_app/modules/auth/verify_email/views/components/verify_email_otp_field.dart';
import 'package:tixe_app/modules/auth/verify_email/views/components/verify_email_resend_otp.dart';
import 'package:tixe_app/utils/app_routes.dart';
import 'package:tixe_app/utils/extension.dart';
import 'package:tixe_app/utils/navigation.dart';
import 'package:tixe_app/utils/styles/k_colors.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: Column(
          children: [
            GlobalText(
              str: context.loc.account_created,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: KColor.white.color,
            ),
            SizedBox(height: 20.h),
            GlobalText(
              str: context.loc.email_sent,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: KColor.white.color,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            const VerifyEmailOtpField(),
            SizedBox(height: 20.h),
            const VerifyEmailResendOtp(),
            const Spacer(),
            Consumer(builder: (context, ref, child) {
              final state = ref.watch(verifyEmailController);
              return GlobalButton(
                onPressed: state.isButtonEnabled
                    ? () {
                        Navigation.push(appRoutes: AppRoutes.personalDetails);
                      }
                    : null,
                buttonText: context.loc.verify_email,
              );
            }),
          ],
        ),
      ),
    );
  }
}
