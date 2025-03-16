import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/profile_flow/profile/views/components/profile_common_item.dart';
import 'package:tixe_flutter_app/modules/profile_flow/profile/views/components/profile_header.dart';
import 'package:tixe_flutter_app/utils/app_routes.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '/global/widget/global_text.dart';
import 'components/profile_arm_store.dart';
import 'components/profile_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const ProfileHeader(),
            const ProfileInfo(),
            const ProfileArmStore(),
            ProfileCommonItem(
              image: KAssetName.icWalletPng.imagePath,
              title: context.loc.list_items_and_services,
              onTap: () {
                Navigation.push(
                  appRoutes: AppRoutes.listingSelection,
                );
              },
            ),
            ProfileCommonItem(
              image: KAssetName.icWalletPng.imagePath,
              title: context.loc.wallet,
              onTap: () {},
            ),
            ProfileCommonItem(
              image: KAssetName.icWalletPng.imagePath,
              title: context.loc.payment_options,
              onTap: () {},
            ),
            ProfileCommonItem(
              image: KAssetName.icPreferencePng.imagePath,
              title: context.loc.preferences,
              onTap: () {
                Navigation.push(
                  appRoutes: AppRoutes.preferences,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          PrefHelper.logout();
          Navigation.pushAndRemoveUntil(appRoutes: AppRoutes.splash);
        },
        child: GlobalText(
          str: context.loc.logout,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: KColor.btnGradient1.color,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
