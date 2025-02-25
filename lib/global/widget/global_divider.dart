import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalDivider extends StatelessWidget {
  final EdgeInsets? padding;

  const GlobalDivider({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Divider(
        color: KColor.btnGradient1.color,
        thickness: 0.1.h,
      ),
    );
  }
}
