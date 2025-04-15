import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/constant/app_url.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/my_arm_detail/model/my_arm_details_response.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyArmDetailScreen extends StatefulWidget {
  final int id;

  const MyArmDetailScreen({
    super.key,
    required this.id,
  });

  @override
  State<MyArmDetailScreen> createState() => _MyArmDetailScreenState();
}

class _MyArmDetailScreenState extends State<MyArmDetailScreen> {
  final ValueNotifier<MyArmDetailResponse?> myArmDetailResponse =
      ValueNotifier(null);

  Future<void> getMyArmDetails() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url:
          AppUrl.myListedArmDetail.url.replaceAll("{ID}", widget.id.toString()),
      method: Method.GET,
      callback: (response, success) {
        Navigation.pop();
        if (success && response != null) {
          myArmDetailResponse.value =
              MyArmDetailResponse.fromJson(response.data);
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      getMyArmDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Details",
          ),
          ValueListenableBuilder(
            valueListenable: myArmDetailResponse,
            builder: (context, data, child) {
              if (data?.data == null) {
                return const SizedBox.shrink();
              }
              final detail = myArmDetailResponse.value!.data!;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: GlobalImageLoader(
                            imagePath: detail.featureImage ?? "",
                            height: 200.h,
                            width: double.infinity,
                            imageFor: ImageFor.network,
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 100.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: (detail.featureImages ?? []).length,
                            itemBuilder: (context, index) {
                              final image = (detail.featureImages ?? [])[index];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(4.r),
                                child: GlobalImageLoader(
                                  imagePath: image,
                                  height: 100.h,
                                  width: 100.w,
                                  imageFor: ImageFor.network,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                width: 10.w,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 10.h),
                        GlobalText(
                          str: detail.title ?? "",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10.h),
                        GlobalText(
                          str: (detail.categories ?? [])
                              .map((e) => e.name ?? '')
                              .join(", "),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 6.h,
                          ),
                          decoration: BoxDecoration(
                            color: KColor.white.color,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child: GlobalText(
                            str: "Selling: \$${detail.price ?? "0"}",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: KColor.black.color,
                          ),
                        ),
                        if (detail.rentalOption == 1) ...[
                          SizedBox(height: 10.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: KColor.white.color,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: GlobalText(
                              str:
                                  "Renting: \$${detail.dailyRentalPrice ?? 0}/Day",
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: KColor.black.color,
                            ),
                          ),
                        ],
                        SizedBox(height: 10.h),
                        Divider(
                          color: KColor.grey.color.withOpacity(0.2),
                        ),
                        SizedBox(height: 10.h),
                        const GlobalText(
                          str: "Description",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(height: 10.h),
                        GlobalText(
                          str: detail.description ?? "",
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: (){},
        buttonText: "Edit",
      ),
    );
  }
}
