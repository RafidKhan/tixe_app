import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class TrainingGearsAndEquipments extends StatelessWidget {
  const TrainingGearsAndEquipments({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      "Night Goggles",
      "UMR Automatic Rifles",
      "Camo Helmet PR",
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.gears_equipments,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: GlobalText(
                      str: "• ${data[index]}",
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: KColor.white.color,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
