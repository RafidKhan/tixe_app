import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../../utils/styles/k_assets.dart';
import '../../controller/training_details_controller.dart';

class TrainingDetailBanners extends ConsumerWidget {
  const TrainingDetailBanners({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(trainingDetailsController);

    final trainingDetail = state.trainingDetail;

    return CarouselSlider(
      options: CarouselOptions(height: 200.0),
      items: (trainingDetail!.galleryImages ?? []).map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: GlobalImageLoader(
                  imagePath: image,
                  height: 200.h,
                  width: context.width,
                  fit: BoxFit.cover,
                  imageFor: ImageFor.network,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
