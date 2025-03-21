import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_bottomsheet_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/controller/list_arms_form_controller.dart';
import 'package:tixe_flutter_app/modules/list_arms_form/views/components/list_arms_form_photo.dart';
import 'package:tixe_flutter_app/modules/listing_payment/model/listing_payment_nav_model.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '/global/widget/global_text.dart';
import '../../../utils/enum.dart';

class ListArmsFormScreen extends StatelessWidget {
  const ListArmsFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(listArmsFormController);
      final controller = ref.read(listArmsFormController.notifier);
      return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const GlobalHeaderWidget(
              title: "Listing Arms",
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ListArmsFormPhoto(),
                      SizedBox(height: 10.h),
                      //title
                      _titleWidget("Title"),
                      SizedBox(height: 10.h),
                      GlobalTextFormfield(
                        textEditingController: controller.titleController,
                      ),
                      SizedBox(height: 10.h),

                      //category
                      _titleWidget("Category"),
                      SizedBox(height: 10.h),
                      GlobalBottomSheetTextFormField(
                        textEditingController: controller.categoryController,
                        onTap: () {
                          ViewUtil.showOptionPickerBottomSheet(
                            options: List.generate(
                              10,
                              (index) => GlobalOptionData(
                                id: index,
                                value: "Category $index",
                              ),
                            ),
                            onSelect: (option) {
                              controller.setCategory(option);
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10.h),

                      //selling price
                      _titleWidget("Selling price"),
                      SizedBox(height: 10.h),
                      GlobalTextFormfield(
                        textEditingController:
                            controller.sellingPriceController,
                        hintText: "\$",
                      ),
                      SizedBox(height: 10.h),

                      //description
                      _titleWidget("Description"),
                      SizedBox(height: 10.h),
                      GlobalTextFormfield(
                        textEditingController: controller.descriptionController,
                        maxLines: 8,
                      ),
                      SizedBox(height: 10.h),

                      //quantity
                      _titleWidget("Quantity Available"),
                      SizedBox(height: 10.h),
                      GlobalTextFormfield(
                        textEditingController:
                            controller.quantityAvailableController,
                      ),
                      SizedBox(height: 10.h),

                      //rental option
                      Row(
                        children: [
                          Switch(
                            value: state.isRentalEnabled,
                            onChanged: (value) {
                              controller.toggleRental();
                            },
                          ),
                          _titleWidget("Rental Option"),
                        ],
                      ),

                      if (state.isRentalEnabled) ...[
                        //daily rental price
                        _titleWidget("Daily Rental Price"),
                        SizedBox(height: 10.h),
                        GlobalTextFormfield(
                          textEditingController:
                              controller.dailyRentalPriceController,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GlobalBottomButton(
          //onPressed: state.isButtonEnabled ? () {} : null,
          onPressed: () {
            Navigation.push(
              appRoutes: AppRoutes.listingPayment,
              arguments: const ListingPaymentNavModel(
                type: ListingType.Arms,
              ),
            );
          },
          buttonText: "Proceed to Next Steps",
        ),
      );
    });
  }

  Widget _titleWidget(String title) {
    return GlobalText(
      str: title,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xffC3C5CA),
    );
  }
}
