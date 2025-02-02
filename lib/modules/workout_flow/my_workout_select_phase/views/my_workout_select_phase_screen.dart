import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_select_phase/controller/my_workout_select_phase_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';
import '../../my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import 'components/my_workout_phases.dart';
import 'components/my_workout_select_phase_header.dart';

class MyWorkoutSelectPhaseScreen extends StatefulWidget {
  final MyWorkoutData model;

  const MyWorkoutSelectPhaseScreen({
    super.key,
    required this.model,
  });

  @override
  State<MyWorkoutSelectPhaseScreen> createState() =>
      _MyWorkoutSelectPhaseScreenState();
}

class _MyWorkoutSelectPhaseScreenState
    extends State<MyWorkoutSelectPhaseScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(myWorkoutSelectPhaseController.notifier);
    Future(() {
      controller.setModel(widget.model);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(myWorkoutSelectPhaseController);

      return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const MyWorkoutSelectPhaseHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      GlobalText(
                        str: context.loc.start,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GlobalText(
                        str: state.model?.description ?? "",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: KColor.grey.color,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      const GlobalDivider(),
                      const MyWorkoutPhases(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
