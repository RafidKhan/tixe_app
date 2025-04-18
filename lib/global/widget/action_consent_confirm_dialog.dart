import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_button.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class ActionConsentConfirmDialog extends StatelessWidget {
  final String message;

  const ActionConsentConfirmDialog({
    super.key,
    this.message =
        "Your information will be updated. Confirm to apply the changes.",
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: KColor.white.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: GlobalText(
              str: "Are you sure?",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: KColor.black.color,
            ),
          ),
          InkWell(
            onTap: () => Navigation.pop(),
            child: Icon(
              Icons.close,
              color: KColor.grey.color,
            ),
          ),
        ],
      ),
      content: GlobalText(
        str: message,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: KColor.black.color,
      ),
      actions: [
        GlobalButton(
            onPressed: () => Navigation.pop(result: true),
            buttonText: "Confirm"),
        SizedBox(
          height: 20.h,
        ),
        GlobalButton(
          onPressed: () => Navigation.pop(),
          borderColor: KColor.btnGradient1.color,
          activeColor: KColor.transparent.color,
          buttonText: "Cancel",
        ),
      ],
    );
  }
}
