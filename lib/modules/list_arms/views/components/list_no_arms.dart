import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/list_arms/controller/list_arms_controller.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class ListNoArms extends StatelessWidget {
  const ListNoArms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read(listArmsControllerProvider.notifier);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 90.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GlobalImageLoader(
            imagePath: KAssetName.noArmsPng.imagePath,
            height: 48.h,
            width: 48.w,
          ),
          SizedBox(height: 20.h),
          const GlobalText(
            str:
                "You haven’t listed any arms yet. Tap on the button to list a training",
            fontSize: 12,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          GlobalButton(
            onPressed: () {
              Navigation.push(appRoutes: AppRoutes.listArmsForm).then((value){
                controller.getArms();
              });
            },
            buttonText: "List Arms",
          )
        ],
      ),
    );
  }
}
