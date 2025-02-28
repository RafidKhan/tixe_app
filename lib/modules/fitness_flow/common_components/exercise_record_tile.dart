import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health/health.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';


class ExerciseRecordTile extends StatelessWidget {
  final HealthDataPoint exercise;

  const ExerciseRecordTile({
    super.key,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    final name = exercise.value.toJson()['workoutActivityType'];
    final calorie = exercise.value.toJson()['totalEnergyBurned'];
    final calorieUnit = exercise.value.toJson()['totalEnergyBurnedUnit'];
    final distance = exercise.value.toJson()['totalDistance'];
    final distanceUnit = exercise.value.toJson()['totalDistanceUnit'];

    final excDuration = exercise.dateTo.difference(exercise.dateFrom).inMinutes;
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
        trailing: Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            color: const Color(0xff6C6B68),
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlobalText(
                str: exercise.dateTo.toString().dayNumber,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              GlobalText(
                str: exercise.dateTo.toString().dayName,
                fontSize: 8,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ),
      ),
    );
  }

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
}
