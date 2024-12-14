import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GearChecklistItem extends StatelessWidget {
  final String title;
  final String gearImage;
  final List<GlobalOptionData> options;

  const GearChecklistItem({
    super.key,
    required this.title,
    required this.gearImage,
    required this.options,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: KColor.darkGrey.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 30.h,
            ),
            decoration: BoxDecoration(
              color: KColor.darkGrey2.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                GlobalImageLoader(
                  imagePath: gearImage,
                  height: 84.h,
                  width: 120.w,
                ),
                SizedBox(height: 20.h),
                GlobalText(
                  str: title,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: KColor.white.color,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              itemBuilder: (context, index) {
                return _optionSelector(
                  options[index],
                  index == 0,
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 10.h);
              })
        ],
      ),
    );
  }

  Widget _optionSelector(GlobalOptionData option, bool isSelected) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: isSelected
              ? EdgeInsets.zero
              : EdgeInsets.only(
                  left: 5.w,
                  bottom: 12.h,
                  right: 6.w,
                ),
          child: GlobalImageLoader(
            imagePath: isSelected
                ? KAssetName.selectedRadioPng.imagePath
                : KAssetName.unselectedRadioPng.imagePath,
            height: isSelected ? 32.h : 20.h,
            width: isSelected ? 32.w : 20.w,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(width: 10.w),
        Flexible(
          child: GlobalText(
            str: option.value,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: KColor.white.color,
          ),
        ),
      ],
    );
  }
}
