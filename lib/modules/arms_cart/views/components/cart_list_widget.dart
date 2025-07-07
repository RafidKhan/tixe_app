import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/arms_cart/views/components/custom_image_bg_container_widget.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../arm_store/controller/arm_store_controller.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartItems = ArmStoreController.cartItems;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GlobalText(
          str: 'Products',
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return Padding(
                  padding: EdgeInsets.only(bottom: 16.w), // Adjust spacing
                  child: Container(
                    height: 110.h,
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                    ),
                    width: context.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: KColor.darkGrey.color,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomImageBGContainerWidget(
                            height: 120.h,
                            width: 100.w,
                            child: GlobalImageLoader(
                              imagePath: item.featureImage ?? "",
                              imageFor: ImageFor.network,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalText(
                                str: item.title ?? "",
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: KColor.white.color,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10.w,
                                  vertical: 3.h,
                                ),
                                decoration: BoxDecoration(
                                  color: KColor.white.color,
                                  borderRadius: BorderRadius.circular(3.r),
                                ),
                                child: GlobalText(
                                  str: "\$${item.price ?? 0}",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: KColor.black.color,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: KColor.white.color,
                            size: 24.sp,
                          ),
                          onPressed: () {
                            ArmStoreController.removeFromCart(item);
                            Future.delayed(const Duration(milliseconds: 100), () {
                              if (cartItems.isEmpty) {
                                Navigation.pop();
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ));
            },
          ),
        ),
      ],
    );
  }
}
