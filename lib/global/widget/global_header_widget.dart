import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalHeaderWidget extends StatelessWidget {
  final String title;
  final bool showBackButton;

  const GlobalHeaderWidget({
    super.key,
    required this.title,
    this.showBackButton=true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(showBackButton)...[
            Padding(
              padding: EdgeInsets.only(top: 4.h),
              child: InkWell(
                onTap: () => Navigation.pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: KColor.white.color,
                ),
              ),
            ),
            SizedBox(
              width: 8.w,
            ),
          ],

          Flexible(
            child: GlobalText(
              str: title,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: KColor.white.color,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
