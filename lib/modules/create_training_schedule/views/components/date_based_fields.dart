import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/utils/date_util.dart';

import '../../controller/create_training_schedule_controller.dart';

class DateBasedFields extends StatelessWidget {
  const DateBasedFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: CrtTrSchdlController.dateBasedFields.length,
          itemBuilder: (context, index) {
            final field = CrtTrSchdlController.dateBasedFields[index];
            return _item(field, context);
          },
        ),
        SizedBox(
          height: 20.h,
        ),
        InkWell(
          onTap: () async {
            CrtTrSchdlController.dateBasedFields.add(
              DateBasedData(
                dateController: TextEditingController(),
                startTimeController: TextEditingController(),
                endTimeController: TextEditingController(),
              ),
            );
            await WidgetsBinding.instance.performReassemble();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 16.h,
              horizontal: 20.w,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.white),
            ),
            child: const Center(
              child: GlobalText(
                str: "+ Add New",
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _item(DateBasedData data, BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalText(
                str: "Date",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffC3C5CA),
              ),
              GlobalTextFormfield(
                textEditingController: data.dateController,
                readOnly: true,
                onTap: () {
                  DateUtil.showDatePickerDialog(
                    firstDate: DateTime.now().add(const Duration(days: 1)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  ).then((dateTime) {
                    if (dateTime != null) {
                      data.dateController.text =
                          DateFormat("yyyy-MM-dd").format(dateTime);
                    }
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalText(
                str: "Start Time",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffC3C5CA),
              ),
              GlobalTextFormfield(
                readOnly: true,
                textEditingController: data.startTimeController,
                onTap: () {
                  CrtTrSchdlController.selectTime().then((time) {
                    if (time != null) {
                      data.startTimeController.text = time.format(context);
                    }
                  });
                },
              ),
            ],
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalText(
                str: "End Time",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xffC3C5CA),
              ),
              GlobalTextFormfield(
                readOnly: true,
                textEditingController: data.endTimeController,
                onTap: () {
                  CrtTrSchdlController.selectTime().then((time) {
                    if (time != null) {
                      data.endTimeController.text = time.format(context);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DateBasedData {
  final TextEditingController dateController;
  final TextEditingController startTimeController;
  final TextEditingController endTimeController;

  DateBasedData({
    required this.dateController,
    required this.startTimeController,
    required this.endTimeController,
  });
}
