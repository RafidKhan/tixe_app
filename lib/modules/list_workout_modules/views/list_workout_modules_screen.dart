import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../utils/app_routes.dart';
import '../../../utils/navigation.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListWorkoutModulesScreen extends StatefulWidget {
  final int id;

  const ListWorkoutModulesScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ListWorkoutModulesScreen> createState() =>
      _ListWorkoutModulesScreenState();
}

class _ListWorkoutModulesScreenState extends State<ListWorkoutModulesScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Listing Workout",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              children: [
                if (count > 0) ...[
                  GlobalText(str: "$count Module(s) Added"),
                  SizedBox(height: 20.h),
                ],
                InkWell(
                  onTap: () {
                    Navigation.push(
                      appRoutes: AppRoutes.listWorkoutAddModuleSelection,
                      arguments: widget.id,
                    ).then((result) {
                      if (result == true) {
                        setState(() {
                          count++;
                        });
                      }
                    });
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
                              str: "Add A Module",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            GlobalText(
                              str: "Tap here to add a module",
                              color: KColor.grey.color,
                              fontSize: 9,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

