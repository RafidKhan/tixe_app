import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_circular_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../controller/list_arms_form_controller.dart';

class ListArmsCategories extends ConsumerStatefulWidget {
  const ListArmsCategories({super.key});

  @override
  ConsumerState<ListArmsCategories> createState() => _ListArmsCategoriesState();
}

class _ListArmsCategoriesState extends ConsumerState<ListArmsCategories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      final controller = ref.read(listArmsFormController.notifier);
      //controller.getArmsCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(listArmsFormController);
      final controller = ref.read(listArmsFormController.notifier);
      return Dialog(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 16.h,
          ),
          child: state.isLoadingCategories
              ? const Center(child: GlobalCircularLoader())
              : SingleChildScrollView(
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
                        itemCount: state.armsCategories.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemBuilder: (context, index) {
                          final category = state.armsCategories[index];
                          return InkWell(
                            onTap: () {
                              category.isSelected = !category.isSelected;
                              setState(() {});
                            },
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: category.isSelected ? 0 : 5.w,
                                    bottom: category.isSelected ? 0 : 10.h,
                                    right: category.isSelected ? 2.w : 6.w,
                                  ),
                                  child: GlobalImageLoader(
                                    imagePath: category.isSelected
                                        ? KAssetName
                                            .selectedCheckBoxPng.imagePath
                                        : KAssetName
                                            .unSelectedCheckboxPng.imagePath,
                                    height: category.isSelected ? 30.h : 20.h,
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
                      GlobalButton(
                        onPressed: () {
                          controller.setCategory();
                          Navigation.pop();
                        },
                        buttonText: "Confirm",
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
