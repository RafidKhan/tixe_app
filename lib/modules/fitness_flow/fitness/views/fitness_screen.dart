import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/user_activity_tracker_services/user_activity_tracker_services.dart';

class FitnessScreen extends StatefulWidget {
  const FitnessScreen({Key? key}) : super(key: key);

  @override
  State<FitnessScreen> createState() => _FitnessScreenState();
}

class _FitnessScreenState extends State<FitnessScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final sharedCon = context.read(sharedController.notifier);

    Future(() {
      sharedCon.checkIsHealthConnectSynced();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final sharedState = ref.watch(sharedController);
      final sharedCon = ref.read(sharedController.notifier);

      return SafeArea(
        child: Scaffold(
          backgroundColor: KColor.transparent.color,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 16.h,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!sharedState.isHealthConnectSynced) ...[
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
                ],
              ],
            ),
          ),
        ),
      );
    });
  }
}
