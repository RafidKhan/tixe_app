import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_scaffold.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/views/components/sign_up_social_login_buttons.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';
import '../controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read(signUpController.notifier);
    return TixeScaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

          return SingleChildScrollView(
            physics: isKeyboardOpen
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 20.h,
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GlobalText(
                          str: context.loc.creating_account,
                          color: KColor.white.color,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GlobalText(
                          str: context.loc.email_or_phone,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: KColor.grey.color,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GlobalTextFormfield(
                        textEditingController:
                            controller.emailOrPhoneController,
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return context.loc.email_or_phone_required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GlobalText(
                          str: context.loc.password,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: KColor.grey.color,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GlobalTextFormfield(
                        textEditingController: controller.passwordController,
                        validator: (value) {
                          if ((value ?? '').trim().isEmpty) {
                            return context.loc.password_required;
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: GlobalText(
                          str: context.loc.reenter_password,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: KColor.grey.color,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      GlobalTextFormfield(
                        textEditingController:
                            controller.confirmPasswordController,
                        validator: (value) {
                          if (value != controller.passwordController.text) {
                            return context.loc.password_not_match;
                          }
                          return null;
                        },
                      ),
                      if (!isKeyboardOpen) const Spacer(),
                      Consumer(builder: (context, ref, child) {
                        final state = ref.watch(signUpController);
                        return GlobalButton(
                          onPressed: state.isButtonEnabled
                              ? () {
                                  controller.signUpUser(context);
                                }
                              : null,
                          buttonText: context.loc.create_account,
                        );
                      }),
                      SizedBox(height: 30.h),
                      const SignUpSocialLoginButtons(),
                      SizedBox(height: 30.h),
                      Wrap(
                        children: [
                          InkWell(
                            onTap: () => Navigation.pop(),
                            child: GlobalText(
                              str: context.loc.please_login,
                              color: KColor.btnGradient1.color,
                            ),
                          ),
                          GlobalText(
                            str: context.loc.if_you_have_account,
                            color: KColor.white.color,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
