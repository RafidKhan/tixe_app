import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/components/fitness_header.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/components/fitness_middle_info.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/components/fitness_sync.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/components/fitness_top_info.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import 'components/fitness_exercise_info.dart';

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
      sharedCon.clearData();
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
              children: [
                const FitnessHeader(),
                SizedBox(height: 20.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const FitnessSync(),
                        const FitnessTopInfo(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const FitnessMiddleInfo(),
                        SizedBox(
                          height: 20.h,
                        ),
                        const FitnessExerciseInfo(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
