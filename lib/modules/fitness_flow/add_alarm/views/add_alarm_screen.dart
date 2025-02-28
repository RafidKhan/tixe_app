import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/add_alarm/controller/add_alarm_controller.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../model/add_alarm_nav_model.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

import 'components/alarm_time_picker.dart';

class AddAlarmScreen extends StatefulWidget {
  final AddAlarmNavModel? model;

  const AddAlarmScreen({
    super.key,
    required this.model,
  });

  @override
  State<AddAlarmScreen> createState() => _AddAlarmScreenState();
}

class _AddAlarmScreenState extends State<AddAlarmScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(addAlarmController.notifier);
    Future(() {
      controller.setModel(widget.model);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(addAlarmController.notifier);

    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Add Alarm",
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AlarmTimePicker(),
                    SizedBox(
                      height: 20.w,
                    ),
                    Consumer(builder: (context, ref, child) {
                      final state = ref.watch(addAlarmController);

                      return Container(
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
                              children: [
                                GlobalText(
                                  str: DateFormat('hh:mm')
                                      .format(state.dateTime),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                                GlobalText(
                                  str: DateFormat(' a').format(state.dateTime),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            GlobalText(
                              str:
                                  "Alarm will ring ${DateFormat('HH:mm:ss').format(state.dateTime).getAlarmTimeDifference()} from now",
                              fontSize: 9,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 16.h,
            ),
            child: Consumer(builder: (context, ref, child) {
              final state = ref.watch(addAlarmController);
              return Row(
                children: [
                  Expanded(
                    child: GlobalButton(
                      onPressed: () {
                        controller.addAlarm();
                      },
                      buttonText: "Save Alarm",
                    ),
                  ),
                  if (state.model?.alarmData?.alarmType != null) ...[
                    SizedBox(
                      width: 20.w,
                    ),
                    Expanded(
                      child: GlobalButton(
                        borderColor: KColor.btnGradient1.color,
                        activeColor: KColor.shadeGradient2.color,
                        textColor: KColor.btnGradient1.color,
                        onPressed: () {
                          if (state.model?.alarmData?.alarmType ==
                              AlarmType.CUSTOM) {
                            controller.deleteAlarm();
                          }
                        },
                        buttonText: state.model?.alarmData?.alarmType ==
                                AlarmType.CUSTOM
                            ? "Delete Alarm"
                            : "Disable Alarm",
                      ),
                    )
                  ],
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
