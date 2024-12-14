import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import '/global/widget/global_text.dart';

class DashboardBottomNavBar extends StatelessWidget {
  const DashboardBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 70.h,
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: KColor.btnGradient1.color),
              left: BorderSide(color: KColor.btnGradient1.color),
              right: BorderSide(color: KColor.btnGradient1.color),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.r),
              topRight: Radius.circular(35.r),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                KColor.shadeGradient1.color.withOpacity(0.83),
                KColor.shadeGradient2.color.withOpacity(0.86),
              ],
            ),
          ),
          child: Row(
            children: [
              _buildRow(
                index: 0,
                image: KAssetName.homePng.imagePath,
                title: "Home",
              ),
              _buildRow(
                index: 1,
                image: KAssetName.trainingPng.imagePath,
                title: "Training",
              ),
              _buildRow(
                index: 2,
                image: KAssetName.workoutPng.imagePath,
                title: "Workout",
              ),
              _buildRow(
                index: 3,
                image: KAssetName.fitnessPng.imagePath,
                title: "Fitness",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow({
    required int index,
    required String image,
    required String title,
  }) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(dashboardController);
      final controller = ref.read(dashboardController.notifier);
      final isSelected = state.selectedIndex == index;
      return Expanded(
        child: InkWell(
          onTap: () => controller.setSelectedIndex(index),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              gradient: isSelected
                  ? LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        KColor.btnGradient1.color,
                        KColor.btnGradient2.color,
                      ],
                    )
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalImageLoader(
                  imagePath: image,
                  height: 15.h,
                  width: 15.w,
                  color: isSelected ? KColor.black.color : null,
                ),
                if (isSelected) ...[
                  SizedBox(width: 10.w),
                  Flexible(
                    child: FittedBox(
                      child: GlobalText(
                        str: title,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: KColor.black.color,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    });
  }
}
