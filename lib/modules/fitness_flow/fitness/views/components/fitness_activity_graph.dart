import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FitnessActivityGraph extends StatelessWidget {
  const FitnessActivityGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 170.h,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: KColor.shadeGradient2.color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GlobalText(
              str: "Activity Graph",
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: KColor.white.color,
            ),
            _progressIndicator(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _colorIndicator(KColor.stepsColor.color, "Steps"),
                _colorIndicator(KColor.calorieColor.color, "Calorie"),
                _colorIndicator(KColor.exerciseColor.color, "Exercise"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _progressIndicator() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Outer Circle
        _circleProgress(
          80,
          color: KColor.stepsColor.color,
        ),
        // Middle Circle
        _circleProgress(
          50,
          color: KColor.calorieColor.color,
        ),
        // Inner Circle
        _circleProgress(
          20,
          color: KColor.exerciseColor.color,
        ),
      ],
    );
  }

  Widget _circleProgress(
    double size, {
    required Color color,
  }) {
    return SizedBox(
      height: size.h,
      width: size.w,
      child: CircularProgressIndicator(
        value: 0.25,
        // 25% progress
        strokeWidth: 8,
        valueColor: AlwaysStoppedAnimation<Color>(color),
        backgroundColor: color.withOpacity(0.3),
        strokeCap: StrokeCap.round,
      ),
    );
  }

  Widget _colorIndicator(Color color, String name) {
    return Row(
      children: [
        Container(
          height: 8.h,
          width: 8.w,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 2.w,
        ),
        GlobalText(
          str: name,
          fontSize: 9,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
