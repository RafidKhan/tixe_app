import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

class MyTrainingItemSmall extends StatelessWidget {
  final String image;
  final String title;

  const MyTrainingItemSmall({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 192.h,
        width: 183.w,
        color: Colors.amber,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            GlobalImageLoader(
              imagePath: image,
              imageFor: ImageFor.network,
              height: 192.h,
              width: 183.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 10.h,
              ),
              child: GlobalText(
                str: title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
