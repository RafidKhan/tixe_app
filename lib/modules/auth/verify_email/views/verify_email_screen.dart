import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_scaffold.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/controller/verify_email_controller.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/views/components/verify_email_otp_field.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/views/components/verify_email_resend_otp.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';

class VerifyEmailScreen extends StatefulWidget {
  final String email;

  const VerifyEmailScreen({
    super.key,
    required this.email,
  });

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(verifyEmailController.notifier);
    Future(() {
      controller.setEmail(widget.email);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(verifyEmailController.notifier);
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
                        controller.verifyRegistrationCode();
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
