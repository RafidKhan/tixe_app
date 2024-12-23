import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_no_data.dart';
import 'package:tixe_flutter_app/modules/home/controller/home_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

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
                          itemCount: state.homeDataList.length,
                          padding: EdgeInsets.only(top: 30.h),
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 20.h);
                          },
                          itemBuilder: (context, index) {
                            return TrainingItemWidget(
                              id: "0",
                              title: "Long Range Sniper Training",
                              image: KAssetName.demoTrainingPng.imagePath,
                              amount: "450",
                              shortDescription:
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis faucibus mi non egestas efficitur. Etiam molestie lectus et rutrum finibus.",
                            );
                          },
                        ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
