import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/review_flow/submit_review/model/submit_review_nav_model.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../controller/submit_review_controller.dart';

class SubmitReviewScreen extends StatefulWidget {
  final SubmitReviewNavModel navModel;

  const SubmitReviewScreen({
    super.key,
    required this.navModel,
  });

  @override
  State<SubmitReviewScreen> createState() => _SubmitReviewScreenState();
}

class _SubmitReviewScreenState extends State<SubmitReviewScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(submitReviewController.notifier);
    Future(() {
      controller.setModel(widget.navModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(submitReviewController);
      final controller = context.read(submitReviewController.notifier);
      return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalHeaderWidget(
              title: "Submit Review",
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: List.generate(state.starStatusList.length, (index) {
                  final status = state.starStatusList[index];
                  return InkWell(
                    onTap: () {
                      controller.updateRating(index);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 4.w),
                      child: GlobalImageLoader(
                        imagePath: status
                            ? KAssetName.starPng.imagePath
                            : KAssetName.icStarUnchekedPng.imagePath,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalText(
                    str: "Details",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: KColor.grey.color,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GlobalTextFormfield(
                    textEditingController: controller.detailController,
                    maxLines: 5,
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: GlobalBottomButton(
          onPressed: state.isButtonEnabled
              ? () {
                  if (state.model?.isUpdate == true) {
                    controller.updateReview();
                  } else {
                    controller.submitReview();
                  }
                }
              : null,
          buttonText:
              state.model?.isUpdate == true ? "Update Review" : "Submit Review",
        ),
      );
    });
  }
}
