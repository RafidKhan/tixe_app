import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../utils/navigation.dart';
import 'arm_store_cart_button.dart';

class ArmStoreHeader extends StatelessWidget {
  const ArmStoreHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
          GlobalText(
            str: "Arm Store",
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: KColor.white.color,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 8.w,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ArmStoreCartButton(),
              PopupMenuButton<String>(
                onSelected: (String value) {
                  switch (value) {
                    case 'history':
                      Navigation.push(appRoutes: AppRoutes.myPurchaseHistory);
                      break;
                    case 'order':
                      break;
                  }
                },
                elevation: 2,
                shadowColor: Colors.black.withOpacity(0.3),
                color: Colors.white,
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'history',
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: const GlobalText(
                        str: 'My Purchase History',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: 'orders',
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: const GlobalText(
                        str: 'Received Orders',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ];
                },
                padding: EdgeInsets.zero,
                menuPadding: EdgeInsets.zero,
                child: const Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
