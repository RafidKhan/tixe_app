import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_no_data.dart';
import 'package:tixe_flutter_app/global/widget/workout_components/workout_item_widget.dart';
import 'package:tixe_flutter_app/modules/home/controller/home_controller.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../global/widget/training_components/training_item_widget.dart';
import '../../../utils/styles/k_colors.dart';
import 'components/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(homeController.notifier);
    Future(() {
      controller.callApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(homeController.notifier);

    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.transparent.color,
        body: Consumer(builder: (context, ref, child) {
          final state = ref.watch(homeController);
          if (state.isLoading) {
            return const GlobalCircularLoader();
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const HomeHeader(),
                Expanded(
                  child: state.homeDataList.isEmpty
                      ? const GlobalNoData()
                      : ListView.separated(
                          controller: controller.scrollController,
                          itemCount: state.homeDataList.length,
                          padding: EdgeInsets.only(top: 30.h),
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 20.h);
                          },
                          itemBuilder: (context, index) {
                            final item = state.homeDataList[index];
                            final serviceType = (item.type ?? "").serviceType();

                            if (serviceType == ServiceType.Training) {
                              return TrainingItemWidget(
                                id: item.id,
                                title: item.title,
                                image: item.image,
                                amount: item.enrollmentFee,
                                shortDescription: item.description,
                              );
                            }
                            if (serviceType == ServiceType.Workout) {
                              return WorkoutItemWidget(
                                id: item.id,
                                title: item.title,
                                image: item.image,
                                amount: item.enrollmentFee,
                                shortDescription: item.description,
                                isFree: item.isPremium != true,
                                time: item.duration,
                                calorie: item.calories,
                                isAfterPurchase: false,
                              );
                            }

                            return const SizedBox.shrink();
                          },
                        ),
                ),
                if (state.isLoadingMore)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: const GlobalCircularLoader(),
                  )
              ],
            ),
          );
        }),
      ),
    );
  }
}
