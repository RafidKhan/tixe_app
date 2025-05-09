import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arm_store/model/arms_category_model.dart';
import 'package:tixe_flutter_app/modules/arm_store/repository/arms_category_repository.dart';
import 'package:tixe_flutter_app/modules/arm_store/views/components/arm_store_gridview.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import 'components/arm_store_header.dart';
import 'components/featured_arms.dart';

class ArmStoreScreen extends StatefulWidget {
  const ArmStoreScreen({super.key});

  @override
  State<ArmStoreScreen> createState() => _ArmStoreScreenState();
}

class _ArmStoreScreenState extends State<ArmStoreScreen> {
  String? _selectedCategory;
  late ArmsCategoryRepository _repository;

  @override
  void initState() {
    super.initState();
    // Initialize repository with ApiClient
    _repository = ArmsCategoryRepository(apiClient: ApiClient());
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const ArmStoreHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    const FeaturedArms(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        const GlobalText(
                          str: "Browse Arms",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        GlobalImageLoader(
                          imagePath: KAssetName.icCategoriesPng.imagePath,
                          height: 14.h,
                          width: 14.w,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            _armCategoryList(context);
                          },
                          child: GlobalText(
                            str: "Categories",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: KColor.btnGradient1.color,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const ArmStoreGridview(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _armCategoryList(BuildContext context) async {
    String? localSelectedCategory = _selectedCategory; // Local variable for dialog state
    bool isLoading = true;
    String? errorMessage;
    List<Data> categories = [];

    // Fetch categories from API
    try {
      final armsCategoryModel = await _repository.fetchArmsCategories();
      if (armsCategoryModel.data != null && armsCategoryModel.data!.isNotEmpty) {
        categories = armsCategoryModel.data!;
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      log('Error fetching categories: $e');
    }

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Container(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GlobalText(
                          str: "Arms Categories",
                          fontSize: 16.sp,
                          color: KColor.black.color,
                          fontWeight: FontWeight.w600,
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(dialogContext).pop();
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    if (isLoading)
                      const Center(child: CircularProgressIndicator())
                    else if (errorMessage != null)
                      GlobalText(
                        str: errorMessage!,
                        fontSize: 14.sp,
                        color: KColor.red.color,
                      )
                    else if (categories.isEmpty)
                        GlobalText(
                          str: "No categories found",
                          fontSize: 14.sp,
                          color: KColor.black.color,
                        )
                      else
                        Flexible(
                          child: SingleChildScrollView(
                            child: Column(
                              children: categories.map((category) {
                                return RadioListTile<String>(
                                  title: GlobalText(
                                    str: category.name ?? 'No Name',
                                    color: KColor.black.color,
                                  ),
                                  value: category.name ?? '',
                                  groupValue: localSelectedCategory,
                                  onChanged: (value) {
                                    setDialogState(() {
                                      localSelectedCategory = value;
                                    });
                                  },
                                  activeColor: KColor.btnGradient1.color,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                    if (!isLoading && categories.isNotEmpty) SizedBox(height: 16.h),
                    if (!isLoading && categories.isNotEmpty)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KColor.btnGradient1.color,
                          minimumSize: Size(double.infinity, 40.h),
                        ),
                        onPressed: () {
                          Navigator.of(dialogContext).pop(localSelectedCategory);
                        },
                        child: GlobalText(
                          str: "Confirm",
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((value) {
      if (value != null) {
        setState(() {
          _selectedCategory = value;
        });
        log("Selected category: $value");
      }
    });
  }
}