import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class MyWorkoutPhaseItem extends StatelessWidget {
  final WorkoutPhase phase;

  const MyWorkoutPhaseItem({super.key, required this.phase});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (phase.isVideo == 1) {
          Navigation.push(
            appRoutes: AppRoutes.myWorkoutVideo,
            arguments: phase,
          );
        } else {
          Navigation.push(
            appRoutes: AppRoutes.myWorkoutPdf,
            arguments: phase,
          );
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GlobalText(
                  str: phase.title ?? "",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              GlobalImageLoader(
                imagePath: KAssetName.icClockPng.imagePath,
                height: 9.h,
              ),
              SizedBox(
                width: 6.w,
              ),
              GlobalText(
                str: "${(phase.durationTime ?? "0")} ${context.loc.minute}",
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: GlobalImageLoader(
                      imagePath: phase.isVideo == 1
                          ? KAssetName.tixeLogoPng.imagePath
                          : KAssetName.pdfPlaceholderPng.imagePath,
                      height: 85.h,
                      width: 85.w,
                    ),
                  ),
                  if (phase.isVideo == 1)
                    Center(
                      child: GlobalImageLoader(
                        imagePath: KAssetName.icVideoPlayPng.imagePath,
                        height: 28.h,
                        width: 28.w,
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: GlobalText(
                  str: phase.description ?? "",
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
