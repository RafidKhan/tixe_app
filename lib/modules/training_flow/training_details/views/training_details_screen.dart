import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/views/components/training_available_slots.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/views/components/training_detail_banners.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/views/components/training_price_and_details.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

import 'components/training_description.dart';
import 'components/training_detail_header.dart';
import 'components/training_gears_and_equipments.dart';
import 'components/training_location.dart';
import 'components/training_pre_requisite.dart';

class TrainingDetailsScreen extends StatelessWidget {
  const TrainingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const TrainingDetailHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const TrainingDetailBanners(),
                  SizedBox(height: 20.h),
                  const TrainingPriceAndDetails(),
                  SizedBox(height: 20.h),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Divider(
                      color: KColor.btnGradient1.color,
                      thickness: 0.1.h,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const TrainingAvailableSlots(),
                  SizedBox(height: 20.h),
                  const TrainingLocation(),
                  SizedBox(height: 20.h),
                  const TrainingDescription(),
                  SizedBox(height: 20.h),
                  const TrainingPreRequisite(),
                  SizedBox(height: 20.h),
                  const TrainingGearsAndEquipments(),
                  SizedBox(height: 20.h),
                  GlobalButton(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    onPressed: () {},
                    buttonText: context.loc.enroll_now,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
