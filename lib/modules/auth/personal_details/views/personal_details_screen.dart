import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_bottomsheet_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_scaffold.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/controller/personal_details_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '/global/widget/global_text.dart';

class PersonalDetailsScreen extends StatefulWidget {
  final String email;

  const PersonalDetailsScreen({
    super.key,
    required this.email,
  });

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(personalDetailsController.notifier);
    Future(() {
      controller.setEmail(widget.email);
      controller.loadAllCountries();
    });
  }

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
              ////country
              _titleWidget(context.loc.country),
              SizedBox(height: 10.h),
              Consumer(builder: (context, ref, child) {
                final state = ref.watch(personalDetailsController);
                return GlobalBottomSheetTextFormField(
                  textEditingController: controller.countryController,
                  onTap: () {
                    ViewUtil.showOptionPickerBottomSheet(
                      options: List.generate(
                        state.countries.length,
                        (index) => GlobalOptionData(
                          id: index,
                          value: state.countries[index].name,
                        ),
                      ),
                      onSelect: (option) {
                        controller.setCountryData(option);
                      },
                    );
                  },
                );
              }),
              SizedBox(height: 20.h),
              ////address
              _titleWidget(context.loc.address),
              SizedBox(height: 10.h),
              GlobalTextFormfield(
                textEditingController: controller.addressController,
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
                        Consumer(builder: (context, ref, child) {
                          final state = ref.watch(personalDetailsController);
                          return GlobalBottomSheetTextFormField(
                            textEditingController: controller.stateController,
                            onTap: () {
                              ViewUtil.showOptionPickerBottomSheet(
                                options: List.generate(
                                  state.states.length,
                                  (index) => GlobalOptionData(
                                    id: index,
                                    value: state.states[index].name,
                                  ),
                                ),
                                onSelect: (option) {
                                  controller.setStateData(option);
                                },
                              );
                            },
                          );
                        }),
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
                        Consumer(builder: (context, ref, child) {
                          final state = ref.watch(personalDetailsController);
                          return GlobalBottomSheetTextFormField(
                            textEditingController: controller.cityController,
                            onTap: () {
                              ViewUtil.showOptionPickerBottomSheet(
                                options: List.generate(
                                  state.cities.length,
                                  (index) => GlobalOptionData(
                                    id: index,
                                    value: state.cities[index].name,
                                  ),
                                ),
                                onSelect: (option) {
                                  controller.setCityData(option);
                                },
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  )
                ],
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
                  onTap: () {
                    controller.setArmsLicense();
                  },
                ),
              ),
              SizedBox(height: 10.h),
              Consumer(builder: (context, ref, child) {
                final state = ref.watch(personalDetailsController);
                if (state.armsLicense != null) {
                  return GlobalText(
                    str: state.armsLicense!.fileName,
                    color: KColor.white.color,
                  );
                }

                return const SizedBox.shrink();
              })
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        final state = ref.watch(personalDetailsController);

        return GlobalBottomButton(
          onPressed: state.isButtonEnabled
              ? () {
                  controller.updateRegistrationPersonalInfo();
                }
              : null,
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
