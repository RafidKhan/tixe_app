import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_bottomsheet_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_scaffold.dart';
import 'package:tixe_flutter_app/modules/auth/fitness_details/controller/fitness_details_controller.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '/global/widget/global_text.dart';

class FitnessDetailsScreen extends StatefulWidget {
  final String email;

  const FitnessDetailsScreen({
    super.key,
    required this.email,
  });

  @override
  State<FitnessDetailsScreen> createState() => _FitnessDetailsScreenState();
}

class _FitnessDetailsScreenState extends State<FitnessDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(fitnessDetailsController.notifier);
    Future(() {
      controller.setEmail(widget.email);
      controller.loadUnitData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(fitnessDetailsController.notifier);
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
                str: context.loc.fitness_details,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: KColor.white.color,
              ),
              SizedBox(height: 30.h),

              ////your age
              _titleWidget(context.loc.your_age),
              SizedBox(height: 10.h),
              GlobalTextFormfield(
                textEditingController: controller.ageController,
                keyboardType: const TextInputType.numberWithOptions(),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              SizedBox(height: 20.h),
              ////your height
              _titleWidget(context.loc.your_height),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GlobalTextFormfield(
                      textEditingController: controller.heightController,
                      keyboardType: const TextInputType.numberWithOptions(),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Consumer(
                      builder: (context, ref, child) {
                        final state = ref.watch(fitnessDetailsController);

                        return GlobalBottomSheetTextFormField(
                          textEditingController:
                              controller.heightUnitController,
                          onTap: () {
                            ViewUtil.showOptionPickerBottomSheet(
                              options: state.heightUnits,
                              onSelect: (option) {
                                controller.setHeightUnit(option);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ////your weight
              _titleWidget(context.loc.your_weight),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: GlobalTextFormfield(
                      textEditingController: controller.weightController,
                      keyboardType: const TextInputType.numberWithOptions(),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Consumer(builder: (context, ref, child) {
                      final state = ref.watch(fitnessDetailsController);
                      return GlobalBottomSheetTextFormField(
                        textEditingController: controller.weightUnitController,
                        onTap: () {
                          ViewUtil.showOptionPickerBottomSheet(
                            options: state.weightUnits,
                            onSelect: (option) {
                              controller.setWeightUnit(option);
                            },
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        final state = ref.watch(fitnessDetailsController);

        return GlobalBottomButton(
          onPressed: state.isButtonEnabled
              ? () {
                  controller.updateRegistrationFitnessDetails();
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
}
