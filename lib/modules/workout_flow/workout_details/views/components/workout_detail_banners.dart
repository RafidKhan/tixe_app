import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/controller/workout_details_controller.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class WorkoutDetailBanners extends ConsumerWidget {
  const WorkoutDetailBanners({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(workoutDetailsController);

    final workoutDetail = state.workoutService;

    final images = (workoutDetail!.galleryImages ?? []);

    return Column(
      children: [
        if (state.videoThumbnail != null) ...[
          SizedBox(
            height: 200.h,
            child: Stack(
              children: [
                Container(
                  height: 200.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: GlobalImageLoader(
                      imagePath: state.videoThumbnail!.path,
                      imageFor: ImageFor.file,
                      height: 200.h,
                      width: context.width,
                    ),
                  ),
                ),
                Center(
                  child: GlobalImageLoader(
                    imagePath: KAssetName.icVideoPlayPng.imagePath,
                    height: 56.h,
                    width: 56.w,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
        SizedBox(
          height: 85.h,
          child: ListView.separated(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10.w,
              );
            },
            itemBuilder: (context, index) {
              final image = images[index];
              return ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: GlobalImageLoader(
                  imagePath: image,
                  height: 85.h,
                  width: 85.w,
                  fit: BoxFit.cover,
                  imageFor: ImageFor.network,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
