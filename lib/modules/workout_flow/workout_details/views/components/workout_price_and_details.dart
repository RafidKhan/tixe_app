import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/controller/workout_details_controller.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../../global/model/review_model.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../utils/styles/k_colors.dart';
import '../../../../review_flow/review/model/review_nav_model.dart';

class WorkoutPriceAndDetails extends ConsumerWidget {
  const WorkoutPriceAndDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workoutDetailsController);
    final controller = ref.read(workoutDetailsController.notifier);
    final workoutDetail = state.workoutService;
    final bool isFree = (workoutDetail?.isPremium != true);
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
                  str:
                      "${workoutDetail?.duration ?? "0 ${context.loc.minute}"}  | ${workoutDetail?.calories ?? 0} Cal",
                  color: KColor.white.color,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    GlobalImageLoader(
                      imagePath: KAssetName.icVideoPng.imagePath,
                      height: 11.h,
                      width: 15.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GlobalText(
                      str: context.loc.videos,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    GlobalImageLoader(
                      imagePath: KAssetName.icInstructionPng.imagePath,
                      height: 12.h,
                      width: 11.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GlobalText(
                      str: context.loc.instructions,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isFree ? KColor.transparent.color : KColor.white.color,
                    borderRadius: BorderRadius.circular(3.r),
                    border: Border.all(
                      color: isFree
                          ? KColor.white.color
                          : KColor.transparent.color,
                    ),
                  ),
                  child: GlobalText(
                    str: isFree
                        ? context.loc.free
                        : "\$${workoutDetail?.enrollmentFee}",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: isFree ? KColor.white.color : KColor.black.color,
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () async {
                    final result = await Navigation.push(
                      appRoutes: AppRoutes.review,
                      arguments: ReviewNavModel(
                        id: state.workoutId,
                        averageRating:
                            state.reviewStatistics?.averageRating ?? 0,
                        totalRatings: state.reviewStatistics?.totalReviews ?? 0,
                        serviceType: ServiceType.Workout,
                        reviews: state.reviewList.map((e) {
                          return ReviewModel(
                            userId: e.user?.id,
                            userImage:
                                e.user?.profileDetails?.profilePhoto ?? '',
                            userName: e.user?.name ?? '',
                            comment: e.comment ?? '',
                            rating: e.rating ?? 0,
                            reviewId: e.id,
                          );
                        }).toList(),
                      ),
                    );
                    if (result == true) {
                      controller.loadWorkoutDetails();
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GlobalImageLoader(
                        imagePath: KAssetName.starPng.imagePath,
                        height: 11.h,
                        width: 11.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      GlobalText(
                        str:
                            "${state.reviewStatistics?.averageRating ?? 0} (${state.reviewStatistics?.totalReviews ?? 0} ${context.loc.reviews})",
                        color: KColor.white.color,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.end,
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
