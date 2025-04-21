import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class NoTraining extends StatelessWidget {
  final Function() onBack;

  const NoTraining({
    super.key,
    required this.onBack,
  });

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
            imagePath: KAssetName.noTrainingPng.imagePath,
            height: 48.h,
            width: 48.w,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 20.h),
          const GlobalText(
            str:
                "You haven’t listed any trainings yet. Tap on the button to list a training",
            fontSize: 12,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          GlobalButton(
            onPressed: () {
              Navigation.push(appRoutes: AppRoutes.listTrainingForm)
                  .then((value) {
                onBack();
                //controller.getArms();
              });
            },
            buttonText: "List Training",
          )
        ],
      ),
    );
  }
}
