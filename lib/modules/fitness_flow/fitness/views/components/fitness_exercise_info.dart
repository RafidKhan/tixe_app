import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/health.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FitnessExerciseInfo extends ConsumerWidget {
  const FitnessExerciseInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sharedController);
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff444339),
            Color(0xff44433C),
          ],
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalText(
            str: "Exercise Record",
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 10.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff10CB71),
                  Color(0xff08A75B),
                ],
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalText(
                        str: "${state.exerciseList.length}",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const GlobalText(
                        str: "Activity Today",
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 1.w,
                  margin: EdgeInsets.only(right: 20.w),
                  color: const Color(0xff47D390),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _hourAndMinute(state.exerciseTime),
                      const GlobalText(
                        str: "Total Active Today",
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const GlobalText(
            str: "All Activity",
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.exerciseList.length,
              itemBuilder: (context, index) {
                final exercise = state.exerciseList[index];
                return _workoutInfo(exercise);
              })
        ],
      ),
    );
  }

  Widget _hourAndMinute(String timeInMinute) {
    // Parse the input timeInMinute into an integer
    final int totalMinutes = int.tryParse(timeInMinute) ?? 0;
    final int hours = totalMinutes ~/ 60; // Calculate hours
    final int minutes = totalMinutes % 60; // Calculate remaining minutes

    return Text.rich(
      TextSpan(children: [
        TextSpan(
          text: hours.toString().padLeft(2, '0'), // Ensure 2-digit format
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
              color: KColor.white.color,
            ),
          ),
        ),
        TextSpan(
          text: 'hr ',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: KColor.white.color,
            ),
          ),
        ),
        TextSpan(
          text: minutes.toString().padLeft(2, '0'), // Ensure 2-digit format
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w600,
              color: KColor.white.color,
            ),
          ),
        ),
        TextSpan(
          text: 'min',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: KColor.white.color,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _workoutInfo(HealthDataPoint exercise) {
    final name = exercise.value.toJson()['workoutActivityType'];
    final calorie = exercise.value.toJson()['totalEnergyBurned'];
    final calorieUnit = exercise.value.toJson()['totalEnergyBurnedUnit'];
    final distance = exercise.value.toJson()['totalDistance'];
    final distanceUnit = exercise.value.toJson()['totalDistanceUnit'];

    'here:: ${exercise.value.toJson()}'.log();

    final excDuration = exercise.dateTo.difference(exercise.dateFrom).inMinutes;

    Widget _bildRow(String icon, String value) {
      return Row(
        children: [
          GlobalImageLoader(
            imagePath: icon,
            height: 9.h,
            width: 9.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          GlobalText(
            str: value,
            fontSize: 9,
            fontWeight: FontWeight.w400,
          ),
        ],
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xff54534F),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListTile(
        title: GlobalText(
          str: name.toString(),
          color: KColor.white.color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        subtitle: Row(
          children: [
            _bildRow(KAssetName.icClockPng.imagePath, "$excDuration min"),
            SizedBox(
              width: 6.w,
            ),
            _bildRow(
              KAssetName.icFirePng.imagePath,
              "$calorie $calorieUnit",
            ),
            SizedBox(
              width: 6.w,
            ),
            if (distance != null)
              _bildRow(
                KAssetName.icWalkingPng.imagePath,
                "$distance $distanceUnit",
              ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
