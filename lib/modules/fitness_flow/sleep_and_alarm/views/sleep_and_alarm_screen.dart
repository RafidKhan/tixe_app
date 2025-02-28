import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/model/alarm_list_response.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import '../../add_alarm/model/add_alarm_nav_model.dart';
import '../../common_components/sleep_info.dart';
import 'package:flutter/material.dart';

import 'components/sleep_and_alarm_header.dart';

class SleepAndAlarmScreen extends StatelessWidget {
  const SleepAndAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const SleepAndAlarmHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Consumer(builder: (context, ref, child) {
                      final state = ref.watch(sharedController);
                      return Column(
                        children: [
                          if (state.morningAlarm != null) ...[
                            _alarmInfo(state.morningAlarm!),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                          if (state.nightAlarm != null) ...[
                            _alarmInfo(state.nightAlarm!),
                            SizedBox(
                              height: 20.h,
                            ),
                          ],
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.alarms.length,
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 20.h,
                              );
                            },
                            itemBuilder: (context, index) {
                              final alarm = state.alarms[index];
                              return _alarmInfo(alarm);
                            },
                          ),
                        ],
                      );
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    GlobalButton(
                      onPressed: () {
                        Navigation.push(
                          appRoutes: AppRoutes.addAlarm,
                        );
                      },
                      activeColor: KColor.shadeGradient2.color,
                      borderColor: KColor.btnGradient1.color,
                      textColor: KColor.white.color,
                      buttonText: "Add Alarm",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const SleepInfo(
                      showEdit: false,
                      showAlarm: false,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _alarmInfo(AlarmData alarm) {
    String? icon;
    DateTime? dateTime = alarm.time?.getDateTime();

    if (alarm.alarmType == AlarmType.MORNING) {
      icon = KAssetName.icSunrisePng.imagePath;
    } else if (alarm.alarmType == AlarmType.NIGHT) {
      icon = KAssetName.icBedtimePng.imagePath;
    }
    final context = Navigation.key.currentContext!;
    return InkWell(
      onTap: () {
        Navigation.push(
          appRoutes: AppRoutes.addAlarm,
          arguments: AddAlarmNavModel(
            alarmData: alarm,
          ),
        );
      },
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
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
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  GlobalImageLoader(
                    imagePath: icon,
                    height: 42.h,
                    width: 42.w,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
                GlobalText(
                  str: dateTime == null
                      ? ""
                      : DateFormat('hh:mm a').format(dateTime),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            GlobalText(
              str:
                  "Alarm will ring ${(alarm.time ?? '').getAlarmTimeDifference()} from now",
              fontSize: 9,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
