import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/data_provider/api_client.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/create_training_schedule/controller/create_training_schedule_controller.dart';
import 'package:tixe_flutter_app/modules/create_training_schedule/model/duration_based_schedule_request.dart';
import 'package:tixe_flutter_app/utils/enum.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';

import '../../../global/model/global_option_item.dart';
import '../../../global/widget/global_bottomsheet_textformfield.dart';
import '../../../utils/view_util.dart';

import 'package:flutter/material.dart';

import 'components/duration_based_fields.dart';

class CreateTrainingScheduleScreen extends StatefulWidget {
  final int trainingId;

  const CreateTrainingScheduleScreen({
    super.key,
    required this.trainingId,
  });

  @override
  State<CreateTrainingScheduleScreen> createState() =>
      _CreateTrainingScheduleScreenState();
}

class _CreateTrainingScheduleScreenState
    extends State<CreateTrainingScheduleScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      CrtTrSchdlController.clearAllData();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ScheduleType> types = [
      ScheduleType.DateBased,
      ScheduleType.DurationBased,
    ];
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(title: "Adding Schedule"),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CrtTrSchdlController.titleWidget("Select Schedule Type"),
                    GlobalBottomSheetTextFormField(
                      textEditingController:
                          CrtTrSchdlController.scheduleNameController,
                      onTap: () {
                        ViewUtil.showOptionPickerBottomSheet(
                          options: types.map((e) {
                            final name = e == ScheduleType.DateBased
                                ? "Date Based"
                                : "Duration Based";
                            return GlobalOptionData(
                              id: e,
                              value: name,
                            );
                          }).toList(),
                          onSelect: (value) {
                            CrtTrSchdlController.setSelectedScheduleType(
                                value.id);
                            setState(() {});
                          },
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    if (CrtTrSchdlController.selectedScheduleType ==
                        ScheduleType.DurationBased)
                      const DurationBasedFields(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: () {
          if (CrtTrSchdlController.selectedScheduleType ==
              ScheduleType.DurationBased) {
            createDurationBasedSchedule();
          }
        },
        buttonText: "Proceed to Next Steps",
      ),
    );
  }

  Future<void> createDurationBasedSchedule() async {
    final selectedDays = CrtTrSchdlController.selectedDays
        .where((element) => element.isSelected)
        .toList();
    final data = DurationBasedScheduleRequest(durationBased: [
      DurationBased(
        startDate: CrtTrSchdlController.startDate.text,
        endDate: CrtTrSchdlController.endDate.text,
        days: selectedDays
            .map((e) => Day(
                  day: e.name,
                  startAt: e.start.text,
                  endAt: e.end.text,
                ))
            .toList(),
      )
    ]);
    print(data.toJson());
    ViewUtil.showLoaderPage();
    await ApiClient().request(
      url: "training-services/${widget.trainingId}/adding-schedule",
      method: Method.POST,
      callback: (response, success) {
        ViewUtil.hideLoader();
        if (success) {
          Navigation.pop();
          ViewUtil.snackBar("Schedule Created Successfully");
        }
      },
    );
  }
}
