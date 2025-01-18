import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../utils/navigation.dart';

class PhaseCompleteWidget extends StatelessWidget {
  final WorkoutPhase phase;

  const PhaseCompleteWidget({
    super.key,
    required this.phase,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: TixeScaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlobalImageLoader(
              imagePath: KAssetName.icCompletePng.imagePath,
              height: 28.h,
              width: 28.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text.rich(
              textAlign: TextAlign.center,
              TextSpan(
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                ),
                children: [
                  TextSpan(
                    text: phase.title ?? "",
                    style: TextStyle(
                      color: KColor.white.color,
                    ),
                  ),
                  TextSpan(
                    text: " ${context.loc.complete}",
                    style: TextStyle(
                      color: KColor.btnGradient1.color,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: GlobalButton(
                onPressed: () {
                  Navigation.pop();
                  Navigation.pop();
                  Navigation.pop(result: true);
                },
                buttonText: context.loc.done,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
