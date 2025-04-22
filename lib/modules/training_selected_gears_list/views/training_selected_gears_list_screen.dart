import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_bottomsheet_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class TrainingSelectedGearsListScreen extends StatelessWidget {
  final int trainingId;

  const TrainingSelectedGearsListScreen({
    super.key,
    required this.trainingId,
  });

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const GlobalHeaderWidget(title: "Listing Gears"),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlobalText(
                  str: "Select Your Gears",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffC3C5CA),
                ),
                SizedBox(height: 10.h),
                GlobalBottomSheetTextFormField(
                  hintText: "Tap here to select",
                  onTap: () {
                    Navigation.push(
                      appRoutes: AppRoutes.trainingGearSelect,
                      arguments: trainingId,
                    );
                  },
                ),
                SizedBox(height: 10.h),
                const Center(
                  child: GlobalText(
                    str: 'Add the gears and arms required for your training',
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: () {},
        buttonText: "Proceed to Next Steps",
      ),
    );
  }
}
