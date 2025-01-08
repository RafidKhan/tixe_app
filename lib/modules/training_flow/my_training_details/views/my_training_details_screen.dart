import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_no_data.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/training_flow/my_training_details/views/components/my_training_available_slots.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../global/widget/global_divider.dart';
import '../controller/my_training_details_controller.dart';
import 'components/my_training_description.dart';
import 'components/my_training_detail_banners.dart';
import 'components/my_training_detail_header.dart';
import 'components/my_training_gears_and_equipments.dart';
import 'components/my_training_location.dart';
import 'components/my_training_pre_requisite.dart';

class MyTrainingDetailsScreen extends StatefulWidget {
  final MyTrainingData model;

  const MyTrainingDetailsScreen({
    super.key,
    required this.model,
  });

  @override
  State<MyTrainingDetailsScreen> createState() => _TrainingDetailsScreenState();
}

class _TrainingDetailsScreenState extends State<MyTrainingDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(myTrainingDetailsController.notifier);
    Future(() {
      controller.setTrainingData(widget.model);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final state = ref.watch(myTrainingDetailsController);

      return TixeMainScaffold(
        hasAppBar: true,
        body: Column(
          children: [
            const MyTrainingDetailHeader(),
            Expanded(
              child: state.trainingDetail == null
                  ? const GlobalNoData()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          const MyTrainingDetailBanners(),
                          SizedBox(height: 20.h),
                          // const MyTrainingPriceAndDetails(),
                          // SizedBox(height: 20.h),
                          SizedBox(height: 10.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: const GlobalDivider(),
                          ),
                          SizedBox(height: 10.h),
                          const MyTrainingAvailableSlots(),
                          SizedBox(height: 20.h),
                          const MyTrainingLocation(),
                          SizedBox(height: 20.h),
                          const MyTrainingDescription(),
                          SizedBox(height: 20.h),
                          const MyTrainingPreRequisite(),
                          SizedBox(height: 20.h),
                          const MyTrainingGearsAndEquipments(),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
            )
          ],
        ),
      );
    });
  }
}
