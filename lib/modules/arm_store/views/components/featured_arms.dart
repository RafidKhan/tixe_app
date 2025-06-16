import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
import 'package:tixe_flutter_app/modules/arm_store/views/components/featured_arm_item.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FeaturedArms extends StatefulWidget {
  const FeaturedArms({super.key});

  @override
  State<FeaturedArms> createState() => _FeaturedArmsState();
}

class _FeaturedArmsState extends State<FeaturedArms> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 340.h,
          child: PageView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return FeaturedArmItem(
                id: 0,
                title: "AR 775B8 - AR Rifle",
                amount: "275",
                shortDescription:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis faucibus mi non egestas",
                image: KAssetName.dummyGearPng.imagePath,
              );
            },
            onPageChanged: (index) {
              ArmStoreController.setPageIndex(index);
              setState(() {});
            },
          ),
        ),
        SizedBox(
          height: 20.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(5, (index) {
            final isSelected = ArmStoreController.pageIndex == index;
            return Container(
              height: 10.h,
              width: 10.w,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: isSelected ? KColor.btnGradient1.color : null,
                border: Border.all(
                  color: isSelected
                      ? KColor.btnGradient1.color
                      : KColor.grey.color,
                ),
                shape: BoxShape.circle,
              ),
            );
          }),
        )
      ],
    );
  }
}
