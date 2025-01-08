import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/my_training_details/controller/my_training_details_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class MyTrainingPreRequisite extends ConsumerWidget {
  const MyTrainingPreRequisite({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myTrainingDetailsController);
    if ((state.trainingDetail?.prerequisites ?? []).isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.pre_requisite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.trainingDetail?.prerequisites?.length ?? 0,
            itemBuilder: (context, index) {
              final item = state.trainingDetail?.prerequisites?[index];
              return Row(
                children: [
                  Expanded(
                    child: GlobalText(
                      str:
                          "• ${item?.title ?? ""}",
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
