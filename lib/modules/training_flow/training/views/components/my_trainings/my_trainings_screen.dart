import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/controller/training_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../global/widget/global_circular_loader.dart';
import '../../../../../../global/widget/training_components/my_training_item_widget_big.dart';
import 'my_training_header.dart';

class MyTrainingsScreen extends StatefulWidget {
  const MyTrainingsScreen({super.key});

  @override
  State<MyTrainingsScreen> createState() => _MyTrainingsScreenState();
}

class _MyTrainingsScreenState extends State<MyTrainingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(trainingController.notifier);
    Future(() {
      controller.listenToScroll();
    });
  }

  @override
  void dispose() {
    final controller = context.read(trainingController.notifier);
    Future(() {
      controller.removeScrollListener();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(trainingController.notifier);

    return SafeArea(
      child: TixeMainScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const MyTrainingHeader(),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final state = ref.watch(trainingController);
                    if (state.isLoadingMyTrainings) {
                      return const GlobalCircularLoader();
                    }
                    return ListView.separated(
                      controller: controller.scrollController,
                      itemCount: state.myTrainings.length,
                      padding: EdgeInsets.only(top: 30.h),
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20.h);
                      },
                      itemBuilder: (context, index) {
                        final item = state.myTrainings[index];
                        return MyTrainingItemWidgetBig(
                          id: item.id,
                          title: item.title,
                          image: item.image,
                          amount: item.enrollmentFee,
                          shortDescription: item.description,
                        );
                      },
                    );
                  },
                ),
              ),
              Consumer(
                builder: (context, ref, child) {
                  final state = ref.watch(trainingController);
                  if (state.isLoadingMoreMyTrainings) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: const GlobalCircularLoader(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
