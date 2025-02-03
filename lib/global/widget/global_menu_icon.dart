import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';

import '../../utils/styles/styles.dart';

class GlobalMenuIcon extends StatelessWidget {
  const GlobalMenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.push(
          appRoutes: AppRoutes.profile,
        );
      },
      child: GlobalImageLoader(
        imagePath: KAssetName.icHamburgerPng.imagePath,
        height: 17.h,
        width: 22.w,
      ),
    );
  }
}
