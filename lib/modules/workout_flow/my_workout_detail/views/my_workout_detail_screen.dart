import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/controller/my_workout_detail_controller.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/views/components/my_workout_detail_history.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import '../../../../global/widget/global_button.dart';
import '../../../../global/widget/global_no_data.dart';
import 'components/my_workout_detail_banners.dart';
import 'components/my_workout_detail_header.dart';
import 'components/my_workout_price_and_details.dart';

class MyWorkoutDetailScreen extends StatefulWidget {
  final int id;

  const MyWorkoutDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<MyWorkoutDetailScreen> createState() => _MyWorkoutDetailScreenState();
}

class _MyWorkoutDetailScreenState extends State<MyWorkoutDetailScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(myWorkoutDetailController.notifier);
    Future(() {
      controller.getMyWorkoutDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(myWorkoutDetailController);
      return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const MyWorkoutDetailHeader(),
            Expanded(
              child: state.detail == null
                  ? const GlobalNoData()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const MyWorkoutDetailBanners(),
                          SizedBox(height: 20.h),
                          const MyWorkoutPriceAndDetails(),
                          SizedBox(height: 40.h),
                          const MyWorkoutDetailHistory(),
                        ],
                      ),
                    ),
            )
          ],
        ),
        bottomNavigationBar: state.detail != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GlobalButton(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    onPressed: () {
                      Navigation.push(
                        appRoutes: AppRoutes.myWorkoutSelectPhase,
                        arguments: state.detail,
                      );
                    },
                    buttonText: context.loc.start_now,
                  ),
                ],
              )
            : null,
      );
    });
  }
}
