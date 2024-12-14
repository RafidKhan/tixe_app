import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalChipWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const GlobalChipWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 3.h,
      ),
      decoration: BoxDecoration(
        color: KColor.white.color,
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: GlobalText(
        str: title,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: KColor.black.color,
        textAlign: TextAlign.end,
      ),
    );
  }
}
