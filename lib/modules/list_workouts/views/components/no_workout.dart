import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';

import '../../../../global/widget/global_image_loader.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/navigation.dart';
import '../../../../utils/styles/k_assets.dart';

class NoWorkout extends StatelessWidget {
  const NoWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 90.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalImageLoader(
            imagePath: KAssetName.noWorkoutPng.imagePath,
            height: 48.h,
            width: 48.w,
          ),
          SizedBox(height: 20.h),
          const GlobalText(
            str:
            "You haven’t listed any workouts yet. Tap on the button to list a training",
            fontSize: 12,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          GlobalButton(
            onPressed: () {
              Navigation.push(appRoutes: AppRoutes.listWorkoutForm).then((value){
                //controller.getArms();
              });
            },
            buttonText: "List Workouts",
          )
        ],
      ),
    );
  }
}
