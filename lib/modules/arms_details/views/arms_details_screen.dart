import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arm_store/views/components/arm_store_header.dart';
import 'package:tixe_flutter_app/modules/arms_details/views/components/custom_image_bg_container_widget.dart';
import 'package:tixe_flutter_app/modules/arms_details/views/components/details_description_section_widget.dart';
import 'package:tixe_flutter_app/modules/arms_details/views/components/details_title_section_widget.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ArmsDetailsScreen extends StatelessWidget {
  const ArmsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const GlobalHeaderWidget(
              title: "Details",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomImageBGContainerWidget(
                height: 200.h,
                child: const Icon(Icons.image),
              ),
            ),
            SizedBox(
              height: 120.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(left:16.w), // Adjust spacing
                    child: CustomImageBGContainerWidget(
                      height: 100.h,
                      width: 120.w,
                      child: const Icon(Icons.image),
                    ),
                  );
                },
              ),
            ),
            DetailsTitleSectionWidget(),
            DetailsDescriptionSectionWidget(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide(color: KColor.btnGradient1.color, width: 2),
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
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigation.push(
                          appRoutes: AppRoutes.armsCart,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KColor.btnGradient1.color,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child:  GlobalText(
                        str: "Buy Now",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: KColor.black.color,
                      ),
        
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

