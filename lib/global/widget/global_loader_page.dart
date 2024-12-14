import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalLoaderPage extends StatelessWidget {
  final String title;
  final String message;

  const GlobalLoaderPage({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Material(
        child: Container(
          height: context.height,
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: 40.w,
            vertical: 40.h,
          ),
          color: KColor.primary.color,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: KColor.white.color,
                backgroundColor: KColor.grey.color,
              ),
              SizedBox(height: 20.h),
              GlobalText(
                str: title,
                color: KColor.white.color,
                fontSize: 24,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              GlobalText(
                str: message,
                color: KColor.white.color,
                fontSize: 12,
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
