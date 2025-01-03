import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/controller/training_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import 'my_training_item_small.dart';

class MyTrainingsHorizontal extends ConsumerWidget {
  const MyTrainingsHorizontal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingController);

    if (state.isLoadingMyTrainings) {
      return const GlobalCircularLoader();
    }

    if (state.myTrainings.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: EdgeInsets.only(
        top: 20.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: GlobalText(
                  str: context.loc.my_trainings,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              GlobalText(
                str: context.loc.see_all,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: KColor.btnGradient1.color,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SizedBox(
            height: 192.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.myTrainings.length,
              itemBuilder: (context, index) {
                final data = state.myTrainings[index];
                return MyTrainingItemSmall(
                  title: data.title ?? "",
                  image: data.image ?? "",
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 12.w,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
