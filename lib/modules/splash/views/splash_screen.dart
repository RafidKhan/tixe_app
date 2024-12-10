import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_app/data_provider/api_client.dart';
import 'package:tixe_app/global/widget/global_button.dart';
import 'package:tixe_app/global/widget/global_image_loader.dart';
import 'package:tixe_app/utils/app_routes.dart';
import 'package:tixe_app/utils/extension.dart';
import 'package:tixe_app/utils/navigation.dart';
import 'package:tixe_app/utils/styles/k_assets.dart';
import 'package:tixe_app/utils/styles/k_colors.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        height: 0,
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GlobalImageLoader(
              imagePath: KAssetName.splashBg.imagePath,
              height: context.height,
              width: context.width,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GlobalText(
                    str: context.loc.splash_message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.squadaOne(
                      color: KColor.white.color,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GlobalButton(
                    onPressed: () {},
                    buttonText: context.loc.explore_now,
                  ),
                  SizedBox(height: 30.h),
                  Wrap(
                    children: [
                      GlobalText(
                        str: context.loc.continue_by,
                        color: KColor.white.color,
                      ),
                      InkWell(
                        onTap: () {
                          Navigation.push(appRoutes: AppRoutes.signIn);
                        },
                        child: GlobalText(
                          str: context.loc.signing_in,
                          color: KColor.btnGradient1.color,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
