import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/controller/training_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../global/widget/global_circular_loader.dart';
import '../../../../global/widget/training_components/training_item_widget.dart';
import '../../../../utils/styles/k_colors.dart';
import 'components/my_trainings/my_trainings_horizontal.dart';
import 'components/training_header.dart';

class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key});

  @override
  State<TrainingScreen> createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(trainingController.notifier);
    Future(() {
      controller.callApis();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.transparent.color,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  const TrainingHeader(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const MyTrainingsHorizontal(),
                          Consumer(builder: (context, ref, child) {
                            final state = ref.watch(trainingController);
                            if (state.isLoadingMyTrainings ||
                                state.isLoadingTrainings) {
                              return const SizedBox.shrink();
                            }

                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: state.trainings.length,
                              padding: EdgeInsets.only(
                                top: 30.h,
                                bottom: 30.h,
                              ),
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 20.h);
                              },
                              itemBuilder: (context, index) {
                                final item = state.trainings[index];
                                return TrainingItemWidget(
                                  id: item.id,
                                  title: item.title,
                                  image: item.image,
                                  amount: item.enrollmentFee,
                                  shortDescription: item.description,
                                );
                              },
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final state = ref.watch(trainingController);
                if (state.isLoadingTrainings || state.isLoadingMyTrainings) {
                  return const GlobalCircularLoader();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
