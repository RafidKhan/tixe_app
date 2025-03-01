import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/review_flow/review/model/review_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import '../controller/review_controller.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  final ReviewNavModel navModel;

  const ReviewScreen({
    super.key,
    required this.navModel,
  });

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(reviewController.notifier);
    Future(() {
      controller.setModel(widget.navModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final state = ref.watch(reviewController);
        return TixeMainScaffold(
          hasAppBar: true,
          body: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: GlobalHeaderWidget(
                      title: "Reviews",
                    ),
                  ),
                  GlobalButton(
                    onPressed: () {
                      Navigation.push(
                        appRoutes: AppRoutes.submitReview,
                      );
                    },
                    fontSize: 14,
                    margin: EdgeInsets.only(right: 20.w),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 10.h,
                    ),
                    buttonText: "Submit Your Review",
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GlobalImageLoader(
                    imagePath: KAssetName.starPng.imagePath,
                    height: 12.h,
                    width: 12.w,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Flexible(
                    child: GlobalText(
                      str:
                          "${state.model?.averageRating ?? 0} (${state.model?.totalRatings ?? 0} reviews)",
                      color: KColor.white.color,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 20,
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                  ),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.h);
                  },
                  itemBuilder: (context, index) {
                    return _reviewItem();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _reviewItem() {
    return Column(
      children: [
        Row(
          children: [
            ClipOval(
              child: GlobalImageLoader(
                imagePath: KAssetName.dummyUserPng.imagePath,
                height: 48.h,
                width: 48.w,
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GlobalText(
                  str: 'Ryan Drofts',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  children: [
                    GlobalImageLoader(
                      imagePath: KAssetName.starPng.imagePath,
                      height: 12.h,
                      width: 12.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    GlobalText(
                      str: '4.5',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        GlobalText(
          str:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id nisi convallis, porta dui id, ullamcorper quam. Pellentesque enim magna",
          fontSize: 12,
          fontWeight: FontWeight.w300,
          color: KColor.grey.color,
        )
      ],
    );
  }
}
