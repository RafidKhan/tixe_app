import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../controller/training_details_controller.dart';

class TrainingGearsAndEquipments extends ConsumerWidget {
  const TrainingGearsAndEquipments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingDetailsController);
    if ((state.trainingDetail?.gearsEquipments ?? []).isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.gears_equipments,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.trainingDetail?.gearsEquipments?.length ?? 0,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemBuilder: (context, index) {
              final gear = state.trainingDetail?.gearsEquipments?[index];
              return Row(
                children: [
                  Expanded(
                    child: GlobalText(
                      str: "• ${gear?.title ?? ""}",
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: KColor.white.color,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
