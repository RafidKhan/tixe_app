import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/review_flow/review/model/review_nav_model.dart';
import 'package:tixe_flutter_app/modules/review_flow/submit_review/model/submit_review_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import '../../../../global/model/review_model.dart';
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
        final sharedState = ref.watch(sharedController);
        final reviews = (state.model?.reviews ?? []);
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
                        arguments: SubmitReviewNavModel(
                          serviceType: state.model!.serviceType,
                          serviceId: state.model!.id!,
                          isUpdate: false,
                          review: null,
                        ),
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
                  itemCount: reviews.length,
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                  ),
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.h);
                  },
                  itemBuilder: (context, index) {
                    final review = reviews[index];
                    return _reviewItem(
                      review,
                      onTap: sharedState.profileData?.data?.id == review.userId
                          ? () {
                              Navigation.push(
                                appRoutes: AppRoutes.submitReview,
                                arguments: SubmitReviewNavModel(
                                  serviceType: state.model!.serviceType,
                                  serviceId: state.model!.id!,
                                  isUpdate: true,
                                  review: review,
                                ),
                              );
                            }
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _reviewItem(ReviewModel review, {required VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: GlobalImageLoader(
                  imagePath: "${AppUrl.baseStorage.url}${review.userImage}",
                  height: 48.h,
                  width: 48.w,
                  placeHolder: KAssetName.dummyUserPng.imagePath,
                ),
              ),
              SizedBox(
                width: 8.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: review.userName,
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
                        str: '${review.rating}',
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
          Align(
            alignment: Alignment.centerLeft,
            child: GlobalText(
              str: review.comment,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: KColor.grey.color,
            ),
          )
        ],
      ),
    );
  }
}
