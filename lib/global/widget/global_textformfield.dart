import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styles/k_colors.dart';

class GlobalTextFormfield extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Function(String value)? onChanged;

  const GlobalTextFormfield({
    super.key,
    this.textEditingController,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: KColor.black.color,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: KColor.white.color,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: KColor.btnGradient1.color,
          ),
        ),
      ),
    );
  }
}
