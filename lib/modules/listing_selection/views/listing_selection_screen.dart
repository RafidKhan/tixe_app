import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';

class ListingSelectionScreen extends StatelessWidget {
  const ListingSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "List Your Items & Services",
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _item(
                      KAssetName.listTrainingPng.imagePath,
                      "List Trainings",
                      "List your training sessions that you will held. Users can enrol in your trainings",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _item(
                      KAssetName.listWorkoutsPng.imagePath,
                      "List Workouts",
                      "List your exercise plans that people can enrol and follow",
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    _item(
                      KAssetName.listArmsPng.imagePath,
                      "List Arms",
                      "List arms and weapons on the weapons store and earn money",
                      onTap: () {
                        Navigation.push(
                          appRoutes: AppRoutes.listArms,
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _item(
    String icon,
    String title,
    String description, {
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(1.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              KColor.btnGradient2.color,
              KColor.btnGradient1.color,
              KColor.transparent.color,
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.r),
            gradient: const LinearGradient(
              colors: [
                Color(0xff444339),
                Color(0xff44433C),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalImageLoader(
                imagePath: icon,
                height: 48.h,
                width: 48.w,
              ),
              SizedBox(height: 10.h),
              GlobalText(
                str: title,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              Divider(
                thickness: 0.5.h,
              ),
              GlobalText(
                str: description,
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
