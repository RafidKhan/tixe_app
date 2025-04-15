import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/list_arms/model/my_listed_arms_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../global/widget/global_button.dart';
import '../../controller/list_arms_controller.dart';

class ListArms extends ConsumerWidget {
  const ListArms({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listArmsControllerProvider);
    final controller = ref.read(listArmsControllerProvider.notifier);
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            GlobalButton(
              margin: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 16.h,
              ),
              onPressed: () {
                Navigation.push(appRoutes: AppRoutes.listArmsForm)
                    .then((value) {
                  controller.getArms();
                });
              },
              buttonText: "List New Arms",
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.arms.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (context, index) {
                final arm = state.arms[index];
                return armItem(arm);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget armItem(MyListedArm arm) {
    final context = Navigation.key.currentContext!;
    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () {
        Navigation.push(
          appRoutes: AppRoutes.myArmDetail,
          arguments: arm.id,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
        ),
        width: context.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KColor.cardGradient1.color,
              KColor.cardGradient2.color,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 3.h,
              ),
              decoration: BoxDecoration(
                color: KColor.white.color,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: GlobalText(
                str: "\$${arm.price}",
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: KColor.black.color,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: arm.title,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  GlobalText(
                    str: "Selling",
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: KColor.secondary.color,
                  ),
                  if (arm.renting) ...[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      height: 5.h,
                      width: 5.w,
                      decoration: BoxDecoration(
                        color: KColor.secondary.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    GlobalText(
                      str: "Renting",
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: KColor.secondary.color,
                    ),
                  ],
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const GlobalDivider(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GlobalText(
                str: arm.description,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: KColor.white.color,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: SizedBox(
                  width: context.width,
                  child: GlobalImageLoader(
                    imagePath: arm.image,
                    height: 130.h,
                    width: context.width,
                    fit: BoxFit.fitWidth,
                    imageFor: ImageFor.network,
                    //imageFor: ImageFor.network,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
