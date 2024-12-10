import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_app/data_provider/api_client.dart';
import 'package:tixe_app/global/widget/global_button.dart';
import 'package:tixe_app/global/widget/global_image_loader.dart';
import 'package:tixe_app/global/widget/global_textformfield.dart';
import 'package:tixe_app/global/widget/tixe_scaffold.dart';
import 'package:tixe_app/modules/sign_in/controller/sign_in_controller.dart';
import 'package:tixe_app/modules/sign_in/views/components/sign_in_social_login_buttons.dart';
import 'package:tixe_app/utils/extension.dart';
import 'package:tixe_app/utils/styles/k_assets.dart';
import 'package:tixe_app/utils/styles/k_colors.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read(signInController.notifier);
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
                      if (!isKeyboardOpen) const Spacer(),
                      GlobalImageLoader(
                        imagePath: KAssetName.tixeLogo.imagePath,
                        height: 48.h,
                        width: 170.w,
                        fit: BoxFit.cover,
                      ),
                      if (!isKeyboardOpen) const Spacer(),
                      GlobalText(
                        str: context.loc.sign_in_to_continue,
                        color: KColor.white.color,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
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
                      GlobalTextFormfield(
                        textEditingController:
                            controller.emailOrPhoneController,
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
                      ),
                      SizedBox(height: 30.h),
                      Consumer(builder: (context, ref, child) {
                        final state = ref.watch(signInController);
                        return GlobalButton(
                          onPressed: state.isButtonEnabled ? () {} : null,
                          buttonText: context.loc.sign_in,
                        );
                      }),
                      SizedBox(height: 30.h),
                      const SignInSocialLoginButtons(),
                      SizedBox(height: 30.h),
                      Wrap(
                        children: [
                          GlobalText(
                            str: context.loc.are_you_new,
                            color: KColor.white.color,
                          ),
                          InkWell(
                            onTap: () {},
                            child: GlobalText(
                              str: context.loc.create_an_account,
                              color: KColor.btnGradient1.color,
                            ),
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