import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';

import '../../utils/styles/styles.dart';

class GlobalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final EdgeInsets? margin;
  final Color? activeColor;
  final Color? borderColor;
  final Color? textColor;
  final double? fontSize;
  final EdgeInsets? contentPadding;

  const GlobalButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.margin,
    this.activeColor,
    this.borderColor,
    this.textColor,
    this.fontSize,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled = (onPressed != null);
    return InkWell(
      onTap: onPressed == null
          ? null
          : () {
              FocusScope.of(context).unfocus();
              onPressed!();
            },
      child: Container(
        margin: margin,
        padding: contentPadding ??
            EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 10.h,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: borderColor ?? KColor.transparent.color,
            width: 0.5.w,
          ),
          color: isButtonEnabled ? null : KColor.disabledBtnColor.color,
          gradient: isButtonEnabled
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    activeColor ?? KColor.btnGradient1.color,
                    activeColor ?? KColor.btnGradient2.color,
                  ],
                )
              : null,
        ),
        child: Center(
          child: GlobalText(
            str: buttonText,
            textAlign: TextAlign.center,
            // fontSize: fontSize??14,
            // fontWeight: FontWeight.w400,
            // color: textColor??KColor.black.color,
            style: GoogleFonts.poppins(
              fontSize: fontSize ?? 14.sp,
              fontWeight: FontWeight.w400,
              color: textColor ?? KColor.black.color,
            ),
          ),
        ),
      ),
    );
  }
}
