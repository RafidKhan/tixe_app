import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/model/global_option_item.dart';
import 'package:tixe_flutter_app/global/widget/global_bottom_button.dart';
import 'package:tixe_flutter_app/global/widget/global_header_widget.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/list_workout_add_module_selection/views/components/text_type_view.dart';
import 'package:tixe_flutter_app/modules/list_workout_add_module_selection/views/components/video_type_view.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '/global/widget/global_text.dart';
import '../../../global/widget/global_bottomsheet_textformfield.dart';
import '../../../utils/styles/k_colors.dart';
import '../controller/list_workout_add_module_selection_controller.dart';
import 'components/pdf_type_view.dart';

enum ModuleTypeEnum {
  Text,
  Doc,
  Video,
}

class ModuleType {
  final ModuleTypeEnum type;
  final String name;

  const ModuleType({
    required this.type,
    required this.name,
  });
}

class ListWorkoutAddModuleSelectionScreen extends StatefulWidget {
  final int id;

  const ListWorkoutAddModuleSelectionScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ListWorkoutAddModuleSelectionScreen> createState() =>
      _ListWorkoutAddModuleSelectionScreenState();
}

class _ListWorkoutAddModuleSelectionScreenState
    extends State<ListWorkoutAddModuleSelectionScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(() {
      ModuleController.dispose();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [
          const GlobalHeaderWidget(
            title: "Adding Module",
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _titleWidget(
                      "Select Type",
                    ),
                    SizedBox(height: 10.h),
                    GlobalBottomSheetTextFormField(
                      textEditingController: ModuleController.type,
                      hintText: "Please Select Type",
                      onTap: () {
                        ViewUtil.showOptionPickerBottomSheet(
                          options: List.generate(
                            ModuleController.types.length,
                            (index) => GlobalOptionData(
                              id: ModuleController.types[index].type,
                              value: ModuleController.types[index].name,
                            ),
                          ),
                          onSelect: (option) {
                            ModuleController.type.text = option.value;
                            ModuleController.selectedType = option.id;
                            setState(() {});
                          },
                        );
                      },
                    ),
                    SizedBox(height: 10.h),
                    _titleWidget(
                      "Module Title",
                    ),
                    SizedBox(height: 10.h),
                    GlobalTextFormfield(
                      textEditingController: ModuleController.module,
                    ),
                    SizedBox(height: 10.h),
                    if (ModuleController.selectedType ==
                        ModuleTypeEnum.Text) ...[
                      const TextTypeView(),
                    ],
                    if (ModuleController.selectedType ==
                        ModuleTypeEnum.Doc) ...[
                      const PdfTypeView(),
                    ],
                    if (ModuleController.selectedType ==
                        ModuleTypeEnum.Video) ...[
                      const VideoTypeView(),
                    ],
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _titleWidget("Calorie Count (Kcal)"),
                              GlobalTextFormfield(
                                textEditingController: ModuleController.calorie,
                              )
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _titleWidget("Duration (min)"),
                              GlobalTextFormfield(
                                textEditingController:
                                    ModuleController.duration,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: GlobalBottomButton(
        onPressed: () {
          if (ModuleController.selectedType == ModuleTypeEnum.Text) {
            ModuleController.createTextModule(widget.id.toString());
          } else {
            ModuleController.createFileModule(widget.id.toString());
          }
        },
        buttonText: "Save",
      ),
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
