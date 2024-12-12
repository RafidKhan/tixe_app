import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalBottomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;

  const GlobalBottomButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: KColor.bodyGradient2.color,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalButton(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            onPressed: onPressed,
            buttonText: buttonText,
          )
        ],
      ),
    );
  }
}
