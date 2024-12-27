import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_map_view_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_enrollment/controller/training_enrollment_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_chip_widget.dart';

class TrainingEnrollmentLocationAndAmount extends ConsumerWidget {
  const TrainingEnrollmentLocationAndAmount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingEnrollmentController);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.training_location,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          GlobalMapViewWidget(
            lat: double.tryParse(state.model?.trainingDetail?.lat ?? "0") ?? 0,
            lon: double.tryParse(state.model?.trainingDetail?.lon ?? "0") ?? 0,
          ),
          SizedBox(height: 30.h),
          GlobalText(
            str: state.model?.trainingDetail?.address ?? "",
            color: KColor.white.color,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(height: 10.h),
          GlobalChipWidget(
            title: "\$${state.model?.trainingDetail?.enrollmentFee ?? ""}",
          ),
        ],
      ),
    );
  }
}
