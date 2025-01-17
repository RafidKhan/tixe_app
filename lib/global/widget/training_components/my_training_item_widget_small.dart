import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../data_provider/pref_helper.dart';
import '../../../modules/training_flow/training/model/my_trainings_response.dart';
import '../../../utils/navigation.dart';

class MyTrainingItemWidgetSmall extends StatelessWidget {
  final int? id;
  final String? title;
  final String? image;
  final ServiceType type;
  final MyTrainingData? trainingData;

  const MyTrainingItemWidgetSmall({
    super.key,
    required this.id,
    required this.title,
    required this.image,
    required this.type,
    required this.trainingData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: KColor.transparent.color,
      focusColor: KColor.transparent.color,
      highlightColor: KColor.transparent.color,
      onTap: () {
        if (PrefHelper.getLoginStatus()) {
          if (type == ServiceType.Training) {
            Navigation.push(
              appRoutes: AppRoutes.myTrainingDetails,
              arguments: trainingData,
            );
          }
          if (type == ServiceType.Workout) {
            // Navigation.push(
            //   appRoutes: AppRoutes.myTrainingDetails,
            //   arguments: id,
            // );
          }
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          height: 192.h,
          width: 183.w,
          color: KColor.primary.color,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              GlobalImageLoader(
                imagePath: image ?? "",
                imageFor: ImageFor.network,
                height: 192.h,
                width: 183.w,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 10.h,
                ),
                child: GlobalText(
                  str: title ?? "",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
