import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
import 'package:tixe_flutter_app/modules/arms_details/controller/arms_details_controller.dart';
import 'package:tixe_flutter_app/modules/arms_details/views/components/custom_image_bg_container_widget.dart';
import 'package:tixe_flutter_app/modules/arms_details/views/components/details_description_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_details/views/components/details_title_section_widget.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';

class ArmsDetailsScreen extends StatefulWidget {
  final int armId;

  const ArmsDetailsScreen({
    Key? key,
    required this.armId,
  }) : super(key: key);

  @override
  State<ArmsDetailsScreen> createState() => _ArmsDetailsScreenState();
}

class _ArmsDetailsScreenState extends State<ArmsDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      ArmsDetailsController.getDetails(widget.armId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detail = ArmsDetailsController.details?.gear;
    return TixeMainScaffold(
      hasAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalHeaderWidget(
              title: "Details",
            ),
            if (detail?.featureImage != null) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomImageBGContainerWidget(
                  height: 200.h,
                  child: GlobalImageLoader(
                    imagePath: detail?.featureImage ?? "",
                    imageFor: ImageFor.network,
                  ),
                ),
              ),
            ],
            if (detail?.featureImages != null &&
                detail?.featureImages?.isNotEmpty == true) ...[
              SizedBox(
                height: 120.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: (detail?.featureImages ?? []).length,
                  itemBuilder: (context, index) {
                    final arm = (detail?.featureImages ?? [])[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 16.w), // Adjust spacing
                      child: CustomImageBGContainerWidget(
                        height: 100.h,
                        width: 120.w,
                        child: GlobalImageLoader(
                          imagePath: arm,
                          imageFor: ImageFor.network,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
            const DetailsTitleSectionWidget(),
            SizedBox(
              height: 20.h,
            ),
            const DetailsDescriptionSectionWidget(),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        ArmStoreController.addToCard(context, widget.armId);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide(
                            color: KColor.btnGradient1.color, width: 2),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: GlobalText(
                        str: "Add to Cart",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: KColor.white.color,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 10),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       Navigation.push(
                  //         appRoutes: AppRoutes.armsCart,
                  //       );
                  //     },
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: KColor.btnGradient1.color,
                  //       padding: EdgeInsets.symmetric(vertical: 12.h),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(8.r),
                  //       ),
                  //     ),
                  //     child: GlobalText(
                  //       str: "Buy Now",
                  //       fontSize: 16.sp,
                  //       fontWeight: FontWeight.w400,
                  //       color: KColor.black.color,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
