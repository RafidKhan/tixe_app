import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_chip_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/review_flow/review/model/review_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../../utils/styles/k_colors.dart';
import '../../controller/training_details_controller.dart';

class TrainingPriceAndDetails extends ConsumerWidget {
  const TrainingPriceAndDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingDetailsController);
    final trainingDetail = state.trainingDetail;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: state.trainingDetail?.address ?? "",
                  color: KColor.white.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                GlobalChipWidget(title: "\$${trainingDetail!.enrollmentFee}"),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 8.h,
                      width: 8.w,
                      decoration: BoxDecoration(
                        color: KColor.green.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: GlobalText(
                        str: context.loc.active_enrolment,
                        color: KColor.white.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    Navigation.push(
                      appRoutes: AppRoutes.review,
                      arguments: ReviewNavModel(
                        id: state.trainingId,
                        averageRating: state.reviewStatistics?.averageRating ?? 0,
                        totalRatings: state.reviewStatistics?.totalReviews ?? 0,
                        serviceType: ServiceType.Training,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      GlobalImageLoader(
                        imagePath: KAssetName.starPng.imagePath,
                        height: 11.h,
                        width: 11.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Flexible(
                        child: GlobalText(
                          str:
                              "${state.reviewStatistics?.averageRating ?? 0} (${state.reviewStatistics?.totalReviews ?? 0} ${context.loc.reviews})",
                          color: KColor.white.color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
