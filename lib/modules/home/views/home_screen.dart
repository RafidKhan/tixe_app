import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../global/widget/training_components/training_item_widget.dart';
import '../../../utils/styles/k_colors.dart';
import 'components/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: KColor.transparent.color,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
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
        ),
      ),
    );
  }
}
