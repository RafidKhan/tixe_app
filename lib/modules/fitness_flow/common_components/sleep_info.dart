import 'dart:async';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../utils/styles/styles.dart';

class SleepInfo extends StatefulWidget {
  const SleepInfo({super.key});

  @override
  State<SleepInfo> createState() => _SleepInfoState();
}

class _SleepInfoState extends State<SleepInfo> {
  final ValueNotifier<DateTime> dateTime = ValueNotifier(DateTime.now());
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        dateTime.value = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isNightTime =
        DateTime.now().hour > 20 || DateTime.now().hour < 6;

    final List<double> sleepData = [
      6.5,
      7,
      8,
      6,
      5.5,
      7.5,
      8.2
    ]; // Example sleep data (Sun-Sat)

    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(sharedController);
      final double sleepHours = double.tryParse(state.sleepTime) ?? 0.0;
      final int hours = sleepHours.floor(); // Whole hours
      final int minutes =
          ((sleepHours - hours) * 60).round(); // Remaining minutes
      return Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff29281E),
              const Color(0xff36352C).withOpacity(0.13),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GlobalImageLoader(
                  imagePath: isNightTime
                      ? KAssetName.icBedtimePng.imagePath
                      : KAssetName.icSunrisePng.imagePath,
                  height: 42.h,
                  width: 42.w,
                ),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: dateTime,
                      builder: (context, date, child) {
                        return GlobalText(
                          str: DateFormat('hh:mm:ss').format(date),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        );
                      },
                    ),
                    const GlobalText(
                      str: "Bedtime 11:30 PM",
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.r),
                      border: Border.all(color: KColor.white.color),
                    ),
                    child: GlobalText(
                      str: 'Edit Alarm',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: KColor.white.color,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30.h),
            const GlobalText(
              str: "Sleeping Record",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 10.h),
            Container(
              width: context.width,
              padding: EdgeInsets.symmetric(
                horizontal: 40.w,
                vertical: 16.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xff5F4A8C),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                children: [
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                      ),
                      children: [
                        TextSpan(
                          text: hours.toString(),
                          style: TextStyle(
                            color: KColor.white.color,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "hr",
                          style: TextStyle(
                            color: KColor.white.color,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: " $minutes",
                          style: TextStyle(
                            color: KColor.white.color,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: "min",
                          style: TextStyle(
                            color: KColor.white.color,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const GlobalText(
                    str: "Total Sleep Today",
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            const GlobalText(
              str: "Recent Sleep Activity",
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: 40.h),
            SizedBox(
              height: 200.h,
              width: context.width,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 15,
                  // Maximum hours of sleep
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          String text;
                          switch (value.toInt()) {
                            case 0:
                              text = 'Mon';
                              break;
                            case 1:
                              text = 'Tue';
                              break;
                            case 2:
                              text = 'Wed';
                              break;
                            case 3:
                              text = 'Thu';
                              break;
                            case 4:
                              text = 'Fri';
                              break;
                            case 5:
                              text = 'Sat';
                              break;
                            case 6:
                              text = 'Sun';
                              break;
                            default:
                              text = '';
                              break;
                          }
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 4,
                            child: GlobalText(
                              str: text,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          return SideTitleWidget(
                            axisSide: meta.axisSide,
                            space: 4.w,
                            child: GlobalText(
                              str: '${value.toInt()}h',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          );
                        },
                        reservedSize: 30.w,
                      ),
                    ),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: sleepData
                      .asMap()
                      .entries
                      .map((entry) => BarChartGroupData(
                            x: entry.key,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value,
                                color: KColor.btnGradient2.color,
                                width: 10,
                                borderRadius: BorderRadius.circular(4),
                              )
                            ],
                          ))
                      .toList(),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
