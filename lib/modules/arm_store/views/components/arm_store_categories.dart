import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ArmStoreCategories extends StatelessWidget {
  const ArmStoreCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ArmStoreController.categories;
    final selectedCategory = ArmStoreController.selectedCategory;
    return Dialog(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 16.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: GlobalText(
                      str: "Arms Categories",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: KColor.black.color,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigation.pop(),
                    child: Icon(
                      Icons.close,
                      color: KColor.black.color,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.h,
                ),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final bool isSelected = category.id == selectedCategory?.id;
                  return InkWell(
                    onTap: () {
                      ArmStoreController.selectCategory(category);
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: isSelected ? 0 : 5.w,
                            bottom: isSelected ? 0 : 10.h,
                            right: isSelected ? 2.w : 6.w,
                          ),
                          child: GlobalImageLoader(
                            imagePath: isSelected
                                ? KAssetName.selectedCheckBoxPng.imagePath
                                : KAssetName.unSelectedCheckboxPng.imagePath,
                            height: isSelected ? 30.h : 20.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 9.h),
                          child: GlobalText(
                            str: category.name ?? "",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: KColor.black.color,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
