import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../data_provider/pref_helper.dart';
import '../../../utils/navigation.dart';

class MyTrainingItemWidgetSmall extends StatelessWidget {
  final MyTrainingData data;

  const MyTrainingItemWidgetSmall({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (PrefHelper.getLoginStatus()) {
          Navigation.push(
            appRoutes: AppRoutes.myTrainingDetails,
            arguments: data,
          );
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          height: 192.h,
          width: 183.w,
          color: KColor.primary.color,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              GlobalImageLoader(
                imagePath: data.image ?? "",
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
                  str: data.title ?? "",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
