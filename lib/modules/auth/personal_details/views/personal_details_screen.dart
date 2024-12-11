import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_app/data_provider/api_client.dart';
import 'package:tixe_app/global/model/global_option_item.dart';
import 'package:tixe_app/global/widget/global_bottom_button.dart';
import 'package:tixe_app/global/widget/global_bottomsheet_textformfield.dart';
import 'package:tixe_app/global/widget/global_button.dart';
import 'package:tixe_app/global/widget/global_textformfield.dart';
import 'package:tixe_app/global/widget/tixe_scaffold.dart';
import 'package:tixe_app/modules/auth/personal_details/controller/personal_details_controller.dart';
import 'package:tixe_app/utils/extension.dart';
import 'package:tixe_app/utils/navigation.dart';
import 'package:tixe_app/utils/styles/k_colors.dart';
import 'package:tixe_app/utils/view_util.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read(personalDetailsController.notifier);
    return TixeScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlobalText(
                str: context.loc.personal_details,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
              SizedBox(height: 30.h),
              ////your name
              _titleWidget(context.loc.your_name),
              SizedBox(height: 10.h),
              GlobalTextFormfield(
                textEditingController: controller.nameController,
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  ////state
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleWidget(context.loc.state),
                        SizedBox(height: 10.h),
                        GlobalBottomSheetTextFormField(
                          textEditingController: controller.stateController,
                          onTap: () {
                            ViewUtil.showOptionPickerBottomSheet(
                              options: List.generate(
                                10,
                                (index) => GlobalOptionData(
                                    id: index, value: "Serial:: ${index + 1}"),
                              ),
                              onSelect: (option) {
                                controller.setStateData(option);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20.w),
                  ////city
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _titleWidget(context.loc.city),
                        SizedBox(height: 10.h),
                        GlobalBottomSheetTextFormField(
                          textEditingController: controller.cityController,
                          onTap: () {
                            ViewUtil.showOptionPickerBottomSheet(
                              options: List.generate(
                                10,
                                    (index) => GlobalOptionData(
                                    id: index, value: "Serial:: ${index + 1}"),
                              ),
                              onSelect: (option) {
                                controller.setCityData(option);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              ////address
              _titleWidget(context.loc.address),
              SizedBox(height: 10.h),
              GlobalTextFormfield(
                textEditingController: controller.addressController,
              ),
              SizedBox(height: 20.h),
              ////country
              _titleWidget(context.loc.country),
              SizedBox(height: 10.h),
              GlobalBottomSheetTextFormField(
                textEditingController: controller.countryController,
                onTap: () {
                  ViewUtil.showOptionPickerBottomSheet(
                    options: List.generate(
                      10,
                          (index) => GlobalOptionData(
                          id: index, value: "Serial:: ${index + 1}"),
                    ),
                    onSelect: (option) {
                      controller.setCountryData(option);
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
              ////arms license
              _titleWidget(context.loc.arms_license),
              SizedBox(height: 10.h),
              GlobalTextFormfield(
                readOnly: true,
                focusNode: AlwaysDisabledFocusNode(),
                suffixIcon: _uploadDocumentButton(
                  context,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        final state = ref.watch(personalDetailsController);

        return GlobalBottomButton(
          onPressed: state.isButtonEnabled ? () {} : null,
          buttonText: context.loc.next,
        );
      }),
    );
  }

  Widget _titleWidget(String text) {
    return GlobalText(
      str: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: KColor.grey.color,
    );
  }

  Widget _uploadDocumentButton(
    BuildContext context, {
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: KColor.primary.color,
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: Center(
              child: GlobalText(
                str: context.loc.upload_docs,
                color: KColor.white.color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
