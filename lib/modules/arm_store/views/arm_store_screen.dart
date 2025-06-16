import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/arm_store/controller/arm_store_controller.dart';
import 'package:tixe_flutter_app/modules/arm_store/model/arms_category_model.dart';
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

  @override
  void initState() {
    super.initState();
    Future(() {
      ArmStoreController.initialize();
      ArmStoreController.getAllArms();
    });
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
              controller: ArmStoreController.scrollController,
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
                          onTap: () {},
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
}
