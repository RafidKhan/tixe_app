import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styles/k_colors.dart';

class GlobalBottomSheetTextFormField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final VoidCallback? onTap;
  final String? hintText;

  const GlobalBottomSheetTextFormField({
    super.key,
    this.textEditingController,
    this.hintText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      readOnly: true,
      focusNode: AlwaysDisabledFocusNode(),
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
        hintText: hintText,
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
        suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
