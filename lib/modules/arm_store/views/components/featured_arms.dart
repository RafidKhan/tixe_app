import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
import 'package:tixe_flutter_app/modules/arm_store/views/components/featured_arm_item.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FeaturedArms extends StatefulWidget {
  const FeaturedArms({super.key});

  @override
  State<FeaturedArms> createState() => _FeaturedArmsState();
}

class _FeaturedArmsState extends State<FeaturedArms> {
  @override
  Widget build(BuildContext context) {
    final featuredArms = ArmStoreController.sliderArms;
    if (featuredArms.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        SizedBox(
          height: 340.h,
          child: PageView.builder(
            itemCount: featuredArms.length,
            itemBuilder: (context, index) {
              final arm = featuredArms[index];
              return FeaturedArmItem(
                id: arm.id,
                title: arm.title ?? "",
                amount: arm.price ?? "0.00",
                shortDescription: arm.description ?? "",
                image: arm.featureImage ?? "",
              );
            },
            onPageChanged: (index) {
              //ArmStoreController.setPageIndex(index);
              //setState(() {});
            },
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
