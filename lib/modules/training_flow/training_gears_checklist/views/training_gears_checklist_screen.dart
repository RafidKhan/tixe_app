import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/controller/training_gears_checklist_controller.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/training_gears_checklist_nav_model.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

import '../../../../global/widget/gear_components/gear_checklist_item.dart';
import '../../../../global/widget/scaffold/tixe_main_scaffold.dart';
import 'components/training_gears_checklist_header.dart';

class TrainingGearsChecklistScreen extends StatefulWidget {
  final TrainingGearsChecklistNavModel model;

  const TrainingGearsChecklistScreen({
    super.key,
    required this.model,
  });

  @override
  State<TrainingGearsChecklistScreen> createState() =>
      _TrainingGearsChecklistScreenState();
}

class _TrainingGearsChecklistScreenState
    extends State<TrainingGearsChecklistScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      final controller =
          context.read(trainingGearsChecklistController.notifier);
      controller.setModel(widget.model);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.read(trainingGearsChecklistController.notifier);
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const TrainingGearsChecklistHeader(),
          Consumer(builder: (context, ref, child) {
            final state = ref.watch(trainingGearsChecklistController);
            return Expanded(
              child: ListView.separated(
                itemCount: state.allGears.length,
                padding: EdgeInsets.only(
                  top: 30.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 40.h,
                ),
                itemBuilder: (context, index) {
                  final gear = state.allGears[index];
                  return GearChecklistItem(
                    title: gear.name ?? "",
                    gearImage: gear.image ?? "",
                    selection: gear.selection,
                    buyingPrice: gear.buyingPrice ?? "0",
                    rentPrice: gear.rentPrice ?? "0",
                    onOptionSelected: (option) {
                      controller.selectGear(gear, option);
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
              ),
            );
          }),
        ],
      ),
      bottomNavigationBar: Consumer(builder: (context, ref, child) {
        final state = ref.watch(trainingGearsChecklistController);
        return GlobalBottomButton(
          onPressed: state.isButtonEnabled
              ? () => Navigation.pop(
                    result: state.selectedGears,
                  )
              : null,
          buttonText: context.loc.done,
        );
      }),
    );
  }
}
