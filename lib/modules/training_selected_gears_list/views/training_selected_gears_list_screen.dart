import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_bottomsheet_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_arms/model/my_listed_arms_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../../../global/widget/global_image_loader.dart';
import '../../../utils/enum.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class TrainingSelectedGearsListScreen extends StatefulWidget {
  final int trainingId;

  const TrainingSelectedGearsListScreen({
    super.key,
    required this.trainingId,
  });

  @override
  State<TrainingSelectedGearsListScreen> createState() =>
      _TrainingSelectedGearsListScreenState();
}

class _TrainingSelectedGearsListScreenState
    extends State<TrainingSelectedGearsListScreen> {
  List<MyListedArm> arms = [];

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
                      arguments: widget.trainingId,
                    ).then((value) {
                      if (value is List<MyListedArm>) {
                        arms = value;
                        setState(() {});
                        ViewUtil.snackBar("Gears set successfully", context);
                      }
                    });
                  },
                ),
                SizedBox(height: 10.h),
                if (arms.isEmpty)
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
          if (arms.isNotEmpty) ...[
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                itemCount: arms.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemBuilder: (context, index) {
                  final arm = arms[index];
                  return armItem(arm);
                },
              ),
            )
          ]
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: () {},
        buttonText: "Proceed to Next Steps",
      ),
    );
  }

  Widget armItem(MyListedArm arm) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      decoration: BoxDecoration(
        color: KColor.darkGrey.color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: GlobalText(
              str: arm.title,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: context.width,
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 30.h,
            ),
            decoration: BoxDecoration(
              color: KColor.darkGrey2.color,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              children: [
                GlobalImageLoader(
                  imagePath: arm.image,
                  height: 84.h,
                  width: 120.w,
                  imageFor: ImageFor.network,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
