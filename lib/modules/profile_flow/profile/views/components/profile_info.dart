import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ProfileInfo extends ConsumerWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sharedController);
    return Container(
      width: context.width,
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 40.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF29281E).withOpacity(1.0),
            const Color(0xFF36352C).withOpacity(0.13),
          ],
        ),
      ),
      child: Row(
        children: [
          ClipOval(
            child: GlobalImageLoader(
              imagePath: KAssetName.dummyUserPng.imagePath,
              height: 72.h,
              width: 72.w,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: state.profileData?.data?.name ?? "",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: KColor.white.color,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 6.h,
                ),
                InkWell(
                  onTap: () {
                    Navigation.push(
                      appRoutes: AppRoutes.profileDetails,
                    );
                  },
                  child: GlobalText(
                    str: context.loc.view_profile,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: KColor.btnGradient1.color,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
