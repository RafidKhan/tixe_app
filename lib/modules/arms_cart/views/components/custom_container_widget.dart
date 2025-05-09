import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class CustomContainerWidget extends StatelessWidget {
  final double height;
  final double? width;
  final Widget child;
  final Color? color;
  const CustomContainerWidget({
    super.key, required this.height,this.color, this.width, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.symmetric(
        vertical: 12.h,horizontal: 16.w,
      ),
      width: width ??  context.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
       color:color ??  KColor.white.color,
      ),
      child: child,
    );
  }
}