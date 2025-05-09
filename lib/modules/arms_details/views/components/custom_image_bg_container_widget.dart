import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class CustomImageBGContainerWidget extends StatelessWidget {
  final double height;
  final double? width;
  final Widget child;
  const CustomImageBGContainerWidget({
    super.key, required this.height, this.width, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      width: width ??  context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
       color: KColor.darkGrey.color,
      ),
      child: child,
    );
  }
}