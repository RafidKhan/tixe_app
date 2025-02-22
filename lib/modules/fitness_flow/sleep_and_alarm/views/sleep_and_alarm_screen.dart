import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';

import '../../common_components/sleep_info.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

import 'components/sleep_and_alarm_header.dart';

class SleepAndAlarmScreen extends StatelessWidget {
  const SleepAndAlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          SleepAndAlarmHeader(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SleepInfo(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
