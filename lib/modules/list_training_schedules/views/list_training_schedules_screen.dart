import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListTrainingSchedulesScreen extends StatelessWidget {
  final int trainingId;

  const ListTrainingSchedulesScreen({
    super.key,
    required this.trainingId,
  });

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Listing Trainings",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigation.push(
                          appRoutes: AppRoutes.createTrainingSchedule,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: KColor.bodyGradient1.color,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xff54534F),
                                borderRadius: BorderRadius.circular(2.r),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const GlobalText(
                                  str: "Add A Schedule",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                GlobalText(
                                  str: "Tap here to add a schedule",
                                  color: KColor.grey.color,
                                  fontSize: 9,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
