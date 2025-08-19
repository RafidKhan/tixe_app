import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_textformfield.dart';
import 'package:tixe_flutter_app/modules/list_workout_add_module_selection/controller/list_workout_add_module_selection_controller.dart';
import 'package:tixe_flutter_app/utils/custom_file_picker.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import '../../../../global/widget/global_bottomsheet_textformfield.dart';
import '../../../../global/widget/global_text.dart';
import '../../../../utils/styles/k_colors.dart';

class VideoTypeView extends StatefulWidget {
  const VideoTypeView({super.key});

  @override
  State<VideoTypeView> createState() => _TextTypeViewState();
}

class _TextTypeViewState extends State<VideoTypeView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleWidget('Attachment'),
        SizedBox(height: 10.h),
        GlobalTextFormfield(
          readOnly: true,
          focusNode: AlwaysDisabledFocusNode(),
          suffixIcon: _uploadDocumentButton(
            context,
            onTap: () {
              CustomFilePicker.pickVideoFile(
                onSuccess: (file) {
                  ModuleController.pickedFile = file;
                  setState(() {});
                },
              );
            },
          ),
        ),
        if (ModuleController.pickedFile != null) ...[
          SizedBox(
            height: 10.h,
          ),
          GlobalText(
            str: ModuleController.pickedFile!.fileName,
            color: KColor.white.color,
          )
        ],
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

  Widget _uploadDocumentButton(
    BuildContext context, {
    required VoidCallback onTap,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: KColor.primary.color,
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: Center(
              child: GlobalText(
                str: "Select Video",
                color: KColor.white.color,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
