import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/modules/list_workout_add_module_selection/controller/list_workout_add_module_selection_controller.dart';

import '../../../../global/widget/global_text.dart';
import '../../../../utils/styles/k_colors.dart';

class TextTypeView extends StatefulWidget {
  const TextTypeView({super.key});

  @override
  State<TextTypeView> createState() => _TextTypeViewState();
}

class _TextTypeViewState extends State<TextTypeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ModuleController.textSections.length,
            itemBuilder: (context, index) {
              final textSection = ModuleController.textSections[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _titleWidget("Section Title"),
                      ),
                      if (index > 0) ...[
                        IconButton(
                          onPressed: () {
                            ModuleController.textSections.removeAt(index);
                            setState(() {});
                          },
                          icon: Icon(
                            Icons.clear,
                            color: KColor.red.color,
                          ),
                        ),
                      ]
                    ],
                  ),
                  SizedBox(height: 10.h),
                  GlobalTextFormfield(
                    textEditingController: textSection.section,
                  ),
                  SizedBox(height: 10.h),
                  _titleWidget("Description"),
                  SizedBox(height: 10.h),
                  GlobalTextFormfield(
                    textEditingController: textSection.description,
                    maxLines: 5,
                  ),
                  SizedBox(height: 30.h),
                ],
              );
            }),
        SizedBox(height: 20.h),
        GlobalButton(
          onPressed: () {
            ModuleController.textSections.add(
              TextSection(
                section: TextEditingController(),
                description: TextEditingController(),
              ),
            );
            setState(() {});
          },
          buttonText: "Add Section",
        ),
      ],
    );
  }

  Widget _titleWidget(String text) {
    return GlobalText(
      str: text,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: KColor.grey.color,
    );
  }
}
