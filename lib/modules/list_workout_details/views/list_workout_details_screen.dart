import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_divider.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_workout_modules/model/list_workout_detail.dart';
import 'package:tixe_flutter_app/modules/review_flow/review/model/review_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListWorkoutDetailsScreen extends StatefulWidget {
  final int id;

  const ListWorkoutDetailsScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ListWorkoutDetailsScreen> createState() =>
      _ListWorkoutDetailsScreenState();
}

class _ListWorkoutDetailsScreenState extends State<ListWorkoutDetailsScreen> {
  ListWorkoutData? data;

  Future<void> getDetails() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: 'workout-services/${widget.id}/show',
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          data = ListWorkoutDetail.fromJson(response?.data).data;
          'here: ${jsonEncode(data?.toJson())}'.log();
          setState(() {});
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      getDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isFree = (data?.isPremium != true);

    return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            GlobalHeaderWidget(
              title: "Overview",
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data?.image != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: GlobalImageLoader(
                            imagePath: data?.image ?? "",
                            imageFor: ImageFor.network,
                            height: 200.h,
                            width: double.infinity,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                      if ((data?.galleryImages ?? []).isNotEmpty) ...[
                        SizedBox(
                          height: 100.h,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: (data?.galleryImages ?? []).length,
                            itemBuilder: (context, index) {
                              final image = (data?.galleryImages ?? [])[index];
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
                        SizedBox(
                          height: 10.h,
                        ),
                      ],

                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalText(
                                  str:
                                  "${data?.duration ?? "0 ${context.loc.minute}"}  | ${data?.calories ?? 0} Cal",
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
                          SizedBox(width: 20.w),
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
                                        : "\$${data?.enrollmentFee}",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: isFree ? KColor.white.color : KColor.black.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      const GlobalDivider(),
                      SizedBox(height: 20.h),

                      GlobalText(
                        str: context.loc.description,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: KColor.white.color,
                      ),
                      SizedBox(height: 20.h),
                      GlobalText(
                        str: data?.description ?? "",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: KColor.white.color,
                      ),


                      SizedBox(height: 20.h),

                      GlobalText(
                        str: context.loc.note,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: KColor.white.color,
                      ),
                      SizedBox(height: 20.h),
                      GlobalText(
                        str: data?.notices ?? "",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: KColor.white.color,
                      ),



                      SizedBox(height: 20.h),
                      GlobalText(
                        str: context.loc.gears_equipments,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: KColor.white.color,
                      ),
                      SizedBox(height: 20.h),
                      GlobalText(
                        str: data?.gearEquipment ?? "",
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: KColor.white.color,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
