import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/styles/k_colors.dart';

class GlobalTextFormfield extends StatelessWidget {
  final TextEditingController? textEditingController;
  final Function(String value)? onChanged;
  final FormFieldValidator<String?>? validator;
  final bool readOnly;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const GlobalTextFormfield({
    super.key,
    this.textEditingController,
    this.maxLines,
    this.onChanged,
    this.validator,
    this.readOnly = false,
    this.focusNode,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: KColor.black.color,
    );
    return TextFormField(
      maxLines: maxLines,
      controller: textEditingController,
      onChanged: onChanged,
      validator: validator,
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      style: style,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: style,
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
        suffixIcon: suffixIcon,
      ),
    );
  }
}
