import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/common_components/exercise_record_tile.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FitnessExerciseInfo extends ConsumerWidget {
  final VoidCallback? onTapDetail;
  final bool showAll;

  const FitnessExerciseInfo({
    super.key,
    required this.onTapDetail,
    required this.showAll,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sharedController);
    final listData =
        showAll ? state.exerciseList : state.exerciseList.take(3).toList();
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
          InkWell(
            onTap: onTapDetail,
            child: Container(
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
          ),
          SizedBox(
            height: 10.h,
          ),
          if (!showAll) ...[
            const GlobalText(
              str: "All Activity",
              fontSize: 9,
              fontWeight: FontWeight.w400,
            ),
          ],
          SizedBox(
            height: 10.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listData.length,
            itemBuilder: (context, index) {
              final exercise = listData[index];
              return ExerciseRecordTile(exercise:exercise);
            },
          )
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
}
