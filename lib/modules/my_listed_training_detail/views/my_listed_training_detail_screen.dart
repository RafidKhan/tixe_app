import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../global/widget/global_map_view_widget.dart';
import '../../../global/widget/global_slot_item_widget.dart';
import '../../../utils/styles/k_colors.dart';
import '../../../utils/view_util.dart';
import '../model/list_training_details.dart';
import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyListedTrainingDetailScreen extends StatefulWidget {
  final int id;

  const MyListedTrainingDetailScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<MyListedTrainingDetailScreen> createState() =>
      _MyListedTrainingDetailScreenState();
}

class _MyListedTrainingDetailScreenState
    extends State<MyListedTrainingDetailScreen> {
  ListTrainingDetails? details;
  List<String> images = [];

  Future<void> getDetails() async {
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "training-services/${widget.id}/show",
      method: Method.GET,
      callback: (response, success) {
        ViewUtil.hideLoader();
        'resp is: ${jsonEncode(response?.data)}'.log();
        if (success && response?.data != null) {
          details = ListTrainingDetails.fromJson(response!.data);
          if (details?.data?.trainingService?.image != null) {
            images.add(details!.data!.trainingService!.image!);
          }
          details?.data?.trainingService?.galleryImages?.forEach((e) {
            images.add(e);
          });
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
    final data = details?.data;
    return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const GlobalHeaderWidget(title: "Overview"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: PageView.builder(
                          itemCount: images.length,
                          itemBuilder: (context, index) {
                            final image = images[index];
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: GlobalImageLoader(
                                imagePath: image,
                                imageFor: ImageFor.network,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 20.h),
                      _title(data?.trainingService?.title ?? ""),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(5.r),
                            ),
                            child: GlobalText(
                              str:
                                  "\$${data?.trainingService?.enrollmentFee ?? 0}",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                          _title("   + Gears charges"),
                        ],
                      ),
                      SizedBox(height: 40.h),
                      _title("Available Slots"),
                      SizedBox(height: 20.h),
                      if (data?.trainingService?.scheduleType ==
                          "duration_based") ...[
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              data?.trainingService?.durationBased?.length ?? 0,
                          itemBuilder: (context, index) {
                            final item =
                                data?.trainingService?.durationBased?[index];
                            return GlobalSlotItemWidget(
                              showSelectedIcon: false,
                              startDayNumber:
                                  (item?.startDate ?? "").dayNumber.toString(),
                              startDayName: (item?.startDate ?? "").dayName,
                              endDayNumber:
                                  (item?.endDate ?? "").dayNumber.toString(),
                              endDayName: (item?.endDate ?? "").dayName,
                              dayList: item?.days
                                      ?.map((e) => e.day ?? "")
                                      .toList() ??
                                  [],
                              isSelected: false,
                              onTap: null,
                            );
                          },
                        ),
                      ],
                      if (data?.trainingService?.scheduleType ==
                          "date_based") ...[
                        Builder(builder: (context) {
                          final items = data?.trainingService?.dateBased
                                  ?.firstOrNull?.dates ??
                              [];
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              'here is: ${item.toJson()}'.log();
                              return Container(
                                margin: EdgeInsets.only(bottom: 20.h),
                                decoration: BoxDecoration(
                                  color: KColor.bodyGradient1.color,
                                  borderRadius: BorderRadius.circular(10.r),
                                  border: Border.all(
                                    color: KColor.transparent.color,
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w, vertical: 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalText(
                                      str: "Date: ${item.date ?? ""}",
                                    ),
                                    GlobalText(
                                      str: "Start Time: ${item.startAt ?? ""}",
                                      color: const Color(0xffABACAD),
                                    ),
                                    GlobalText(
                                      str: "End Time: ${item.endAt ?? ""}",
                                      color: const Color(0xffABACAD),
                                    ),
                                  ],
                                ),
                              );
                              // return GlobalSlotItemWidget(
                              //   showSelectedIcon: false,
                              //   startDayNumber:
                              //   (item?.startDate ?? ""),
                              //   startDayName: (item?.startDate ?? ""),
                              //   endDayNumber:
                              //   (item?.endDate ?? ""),
                              //   endDayName: (item?.endDate ?? ""),
                              //   dayList: item?.dates
                              //       ?.map((e) => e.date ?? "")
                              //       .toList() ??
                              //       [],
                              //   isSelected: false,
                              //   onTap: null,
                              // );
                            },
                          );
                        }),
                      ],
                      SizedBox(height: 20.h),
                      _title("Location"),
                      SizedBox(height: 20.h),
                      GlobalMapViewWidget(
                        lat: double.tryParse(
                                data?.trainingService?.lat ?? "0") ??
                            0,
                        lon: double.tryParse(
                                data?.trainingService?.lon ?? "0") ??
                            0,
                      ),
                      SizedBox(height: 20.h),
                      _title("Description"),
                      SizedBox(height: 20.h),
                      GlobalText(
                        str: data?.trainingService?.description ?? "",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xffABACAD),
                      ),
                      SizedBox(height: 20.h),
                      _title("Pre-requisite"),
                      SizedBox(height: 20.h),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            data?.trainingService?.prerequisites?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item =
                              data?.trainingService?.prerequisites?[index];
                          return GlobalText(
                            str: item?.title ?? "",
                            color: const Color(0xffABACAD),
                          );
                        },
                      ),
                      SizedBox(height: 20.h),
                      if (data?.trainingService?.gearsEquipments?.isNotEmpty ??
                          false) ...[
                        _title("Gears & Equipments"),
                        SizedBox(height: 20.h),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              data?.trainingService?.gearsEquipments?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            final item =
                                data?.trainingService?.gearsEquipments?[index];
                            return GlobalText(
                              str: item?.title ?? "",
                              color: const Color(0xffABACAD),
                            );
                          },
                        ),
                      ],
                      SizedBox(height: 40.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _title(String text) {
    return GlobalText(
      str: text,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
  }
}
