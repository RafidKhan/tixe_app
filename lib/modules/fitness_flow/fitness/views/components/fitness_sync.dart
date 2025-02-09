import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/user_activity_tracker_services/user_activity_tracker_services.dart';

class FitnessSync extends ConsumerWidget {
  const FitnessSync({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedState = ref.watch(sharedController);
    final sharedCon = ref.read(sharedController.notifier);
    if (PrefHelper.getLoginStatus()) {
      if (!sharedState.isHealthConnectSynced) {
        return Column(
          children: [
            InkWell(
              onTap: () async {
                if (!sharedState.isHealthConnectSynced) {
                  await UserActivityTrack.authorize();
                }

                sharedCon.checkIsHealthConnectSynced();
              },
              child: Container(
                width: context.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 6.h,
                ),
                decoration: BoxDecoration(
                  color: KColor.shadeGradient1.color,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                      text: context.loc.connect_to_health_1,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: KColor.white.color,
                      )),
                    ),
                    TextSpan(
                      text: context.loc.connect_to_health_2,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: KColor.btnGradient1.color,
                      )),
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        );
      }

      return GlobalButton(
          onPressed: () {
            sharedCon.fetchFitnessData();
          },
          buttonText: "Fetch Data");
    }

    return const SizedBox.shrink();
  }
}
