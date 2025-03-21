import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/mixin/unit_conversion_mixin.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../../global/global_module/shared/shared_controller.dart';
import '../../../../../global/widget/global_text.dart';
import '../../../../../utils/styles/k_colors.dart';

class ProfileDetailInfo extends ConsumerWidget with UniConversionMixin{
  const ProfileDetailInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sharedController);
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xff29281E),
            const Color(0xff36352C).withOpacity(0.13),
          ],
        ),
      ),
      child: Column(
        children: [
          _buildInfoRow(KAssetName.icPersonPng.imagePath,
              "${state.profileData?.data?.name}(${state.profileData?.data?.profileDetails?.age ?? 0})"),
          GlobalDivider(
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          _buildInfoRow(KAssetName.icHeight2Png.imagePath,
              "Height: ${convertHeightToPreferredUnit(state.profileData?.data?.profileDetails?.height??"", state.profileData?.data?.profileDetails?.heightUnit ?? "")} ${state.profileData?.data?.profileDetails?.heightUnit ?? ""}"),
          GlobalDivider(
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          _buildInfoRow(KAssetName.icWeight2Png.imagePath,
              "Weight: ${convertWeightToPreferredUnit(state.profileData?.data?.profileDetails?.weight??"", state.profileData?.data?.profileDetails?.weightUnit ?? "")} ${state.profileData?.data?.profileDetails?.weightUnit ?? ""}"),
          GlobalDivider(
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          _buildInfoRow(KAssetName.icLocationPng.imagePath,
              "${state.profileData?.data?.profileDetails?.state}, ${state.profileData?.data?.profileDetails?.city}, ${state.profileData?.data?.profileDetails?.country}"),
          GlobalDivider(
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          _buildInfoRow(KAssetName.icCurrentLocationPng.imagePath,
              "${state.profileData?.data?.profileDetails?.address}"),
          GlobalDivider(
            padding: EdgeInsets.symmetric(vertical: 10.h),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: GlobalText(
              str: "Arms License",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: KColor.shadeGradient1.color,
            ),
            child: GlobalImageLoader(
              imagePath: state.profileData?.data?.armsLicense ?? "",
              imageFor: ImageFor.network,
              height: 128.h,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoRow(String icon, String title) {
    return Row(
      children: [
        GlobalImageLoader(
          imagePath: icon,
          height: 15.h,
          width: 15.w,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: GlobalText(
            str: title,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
