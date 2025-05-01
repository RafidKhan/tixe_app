import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/utils/date_util.dart';

import '../../../../global/widget/global_image_loader.dart';
import '../../../../utils/styles/k_assets.dart';
import '../../controller/create_training_schedule_controller.dart';

class DurationBasedFields extends StatelessWidget {
  const DurationBasedFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrtTrSchdlController.titleWidget("Start Date"),
        GlobalTextFormfield(
          readOnly: true,
          textEditingController: CrtTrSchdlController.startDate,
          onTap: () {
            DateUtil.showDatePickerDialog(
              firstDate: DateTime.now().add(const Duration(days: 1)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            ).then((dateTime) {
              if (dateTime != null) {
                CrtTrSchdlController.startDate.text =
                    DateFormat("yyyy-MM-dd").format(dateTime);
              }
            });
          },
        ),
        SizedBox(height: 10.h),
        CrtTrSchdlController.titleWidget("End Date"),
        GlobalTextFormfield(
          readOnly: true,
          textEditingController: CrtTrSchdlController.endDate,
          onTap: () {
            DateUtil.showDatePickerDialog(
              firstDate: DateTime.now().add(const Duration(days: 1)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            ).then((dateTime) {
              if (dateTime != null) {
                CrtTrSchdlController.endDate.text =
                    DateFormat("yyyy-MM-dd").format(dateTime);
              }
            });
          },
        ),
        SizedBox(height: 30.h),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: CrtTrSchdlController.selectedDays.length,
          itemBuilder: (context, index) {
            final item = CrtTrSchdlController.selectedDays[index];
            return _itemData(item);
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.h);
          },
        )
      ],
    );
  }

  Widget _itemData(SelectedDayData item) {
    return StatefulBuilder(builder: (context, setState) {
      return Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  item.isSelected = !item.isSelected;
                  setState(() {});
                },
                child: Padding(
                  padding: EdgeInsets.only(
                    left: item.isSelected ? 0 : 5.w,
                    bottom: item.isSelected ? 0 : 10.h,
                    right: item.isSelected ? 2.w : 6.w,
                  ),
                  child: GlobalImageLoader(
                    imagePath: item.isSelected
                        ? KAssetName.selectedCheckBoxPng.imagePath
                        : KAssetName.unSelectedCheckboxPng.imagePath,
                    height: item.isSelected ? 30.h : 20.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 5.w),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 10.h,
                ),
                child: GlobalText(
                  str: item.name,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(str: 'Starting Time'),
                    SizedBox(height: 5.h),
                    GlobalTextFormfield(
                      textEditingController: item.start,
                      readOnly: true,
                      onTap: item.isSelected
                          ? () {
                              CrtTrSchdlController.selectTime().then((time) {
                                if (time != null) {
                                  item.start.text = time.format(context);
                                }
                              });
                            }
                          : null,
                    )
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GlobalText(str: 'Ending Time'),
                    SizedBox(height: 5.h),
                    GlobalTextFormfield(
                      textEditingController: item.end,
                      readOnly: true,
                      onTap: item.isSelected
                          ? () {
                              CrtTrSchdlController.selectTime().then((time) {
                                if (time != null) {
                                  item.end.text = time.format(context);
                                }
                              });
                            }
                          : null,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      );
    });
  }
}

class SelectedDayData {
  final String name;
  final TextEditingController start;
  final TextEditingController end;
  bool isSelected;

  SelectedDayData({
    required this.name,
    required this.start,
    required this.end,
    this.isSelected = false,
  });
}
