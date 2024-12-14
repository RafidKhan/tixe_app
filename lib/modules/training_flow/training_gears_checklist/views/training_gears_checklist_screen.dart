import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../global/widget/gear_components/gear_checklist_item.dart';
import '../../../../global/widget/scaffold/tixe_main_scaffold.dart';
import 'components/training_gears_checklist_header.dart';

class TrainingGearsChecklistScreen extends StatelessWidget {
  const TrainingGearsChecklistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const TrainingGearsChecklistHeader(),
          Expanded(
            child: ListView.separated(
              itemCount: 20,
              padding: EdgeInsets.only(
                top: 30.h,
                left: 20.w,
                right: 20.w,
                bottom: 40.h,
              ),
              itemBuilder: (context, index) {
                return GearChecklistItem(
                  title: "HR3 Holographic Sight",
                  gearImage: KAssetName.dummyGearPng.imagePath,
                  options: const [
                    GlobalOptionData(id: 0, value: "I got it"),
                    GlobalOptionData(id: 1, value: "Buy - \$175.00"),
                    GlobalOptionData(id: 2, value: "Rent - \$75.00"),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: () => Navigation.pop(),
        buttonText: context.loc.done,
      ),
    );
  }
}
