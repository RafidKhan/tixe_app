import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../auth/personal_details/model/personal_detail_nav_model.dart';
import '/global/widget/global_text.dart';
import 'components/profile_detail_info.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Profile",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    ClipOval(
                      child: GlobalImageLoader(
                        imagePath: KAssetName.dummyUserPng.imagePath,
                        height: 112.h,
                        width: 112.w,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      children: [
                        const GlobalText(
                          str: "Details",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        const Spacer(),
                        GlobalImageLoader(
                          imagePath: KAssetName.icEditPng.imagePath,
                          height: 14.h,
                          width: 14.w,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Consumer(builder: (context, ref, child) {
                          final sharedState = ref.watch(sharedController);
                          return InkWell(
                            onTap: () {
                              Navigation.push(
                                appRoutes: AppRoutes.personalDetails,
                                arguments: PersonalDetailsNavModel(
                                    email:
                                        sharedState.profileData?.data?.email ??
                                            "",
                                    actionType: ActionType.Update,
                                    profileResponse: sharedState.profileData),
                              );
                            },
                            child: GlobalText(
                              str: "Edit",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: KColor.btnGradient1.color,
                            ),
                          );
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const ProfileDetailInfo(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
