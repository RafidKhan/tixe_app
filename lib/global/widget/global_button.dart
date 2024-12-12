import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';

import '../../utils/styles/styles.dart';

class GlobalButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final EdgeInsets? margin;

  const GlobalButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.margin,
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
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: isButtonEnabled ? null : KColor.disabledBtnColor.color,
          gradient: isButtonEnabled
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    KColor.btnGradient1.color,
                    KColor.btnGradient2.color,
                  ],
                )
              : null,
        ),
        child: Center(
          child: GlobalText(
            str: buttonText,
            textAlign: TextAlign.center,
            style: GoogleFonts.squadaOne(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: KColor.black.color,
            ),
          ),
        ),
      ),
    );
  }
}
