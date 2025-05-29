import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/controller/list_arms_form_controller.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../utils/enum.dart';

class ListArmsFormPhoto extends ConsumerWidget {
  const ListArmsFormPhoto({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listArmsFormController);
    final controller = ref.read(listArmsFormController.notifier);
    return Column(
      children: [
        if (state.showFeaturedImageFromNetwork) ...[
          Stack(
            children: [
              InkWell(
                onTap: state.featuredNetworkImage == null
                    ? () {
                        controller.selectFeaturedImage();
                      }
                    : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: GlobalImageLoader(
                    imagePath: state.featuredNetworkImage ?? "",
                    height: 200.h,
                    width: double.infinity,
                    imageFor: ImageFor.network,
                  ),
                ),
              ),
              if (state.featuredNetworkImage != null)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      controller.deleteImage(
                        state.featuredNetworkImage!,
                        context,
                        onSuccess: () {
                          controller.removeFeaturedNetworkImage();
                        },
                      );
                      //removeFeaturedImage();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: KColor.white.color,
                    ),
                  ),
                ),
            ],
          ),
        ] else ...[
          Stack(
            children: [
              InkWell(
                onTap: state.featuredImage == null
                    ? () {
                        controller.selectFeaturedImage();
                      }
                    : null,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: GlobalImageLoader(
                    imagePath: state.featuredImage != null
                        ? state.featuredImage!.path
                        : KAssetName.addPhoto1Png.imagePath,
                    height: 200.h,
                    width: double.infinity,
                    imageFor: state.featuredImage != null
                        ? ImageFor.file
                        : ImageFor.asset,
                  ),
                ),
              ),
              if (state.featuredImage != null)
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {
                      controller.removeFeaturedImage();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: KColor.white.color,
                    ),
                  ),
                ),
            ],
          ),
        ],
        SizedBox(
          height: 20.h,
        ),
        if (state.showListImageFromNetwork) ...[
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.networkImages.length + 1,
              itemBuilder: (context, index) {
                if (index < state.networkImages.length) {
                  final image = state.networkImages[index];
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: GlobalImageLoader(
                          imagePath: image.path,
                          height: 100.h,
                          width: 100.w,
                          imageFor: image.imageFor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 6.h,
                        ),
                        child: InkWell(
                          onTap: () {
                            if (image.imageFor == ImageFor.network) {
                              controller.deleteImage(image.path, context,
                                  onSuccess: () {
                                controller.removeNetworkImage(index);
                              });
                            } else {
                              controller.removeNetworkImage(index);
                            }
                          },
                          child: Icon(
                            Icons.delete,
                            color: KColor.white.color,
                            size: 18.w,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return InkWell(
                  onTap: () {
                    controller.addNetworkImage(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: GlobalImageLoader(
                      imagePath: KAssetName.addPhoto2Png.imagePath,
                      height: 100.h,
                      width: 100.w,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.w,
                );
              },
            ),
          )
        ] else ...[
          SizedBox(
            height: 100.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: state.images.length + 1,
              itemBuilder: (context, index) {
                if (index < state.images.length) {
                  final image = state.images[index];
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: GlobalImageLoader(
                          imagePath: image.path,
                          height: 100.h,
                          width: 100.w,
                          imageFor: ImageFor.file,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6.w,
                          vertical: 6.h,
                        ),
                        child: InkWell(
                          onTap: () {
                            controller.removeImage(index);
                          },
                          child: Icon(
                            Icons.delete,
                            color: KColor.white.color,
                            size: 18.w,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return InkWell(
                  onTap: () {
                    controller.addImage(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: GlobalImageLoader(
                      imagePath: KAssetName.addPhoto2Png.imagePath,
                      height: 100.h,
                      width: 100.w,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.w,
                );
              },
            ),
          )
        ],
      ],
    );
  }
}
