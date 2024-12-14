import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tixe_flutter_app/global/widget/global_image_loader.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/views/components/training_slot_item.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../global/widget/global_header_widget.dart';
import '../../../../../utils/styles/k_assets.dart';

class TrainingDescription extends StatelessWidget {
  const TrainingDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalText(
            str: context.loc.description,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: KColor.white.color,
          ),
          SizedBox(height: 20.h),
          GlobalText(
            str:
                "Nullam varius ullamcorper dui. Nam sollicitudin sodales metus, id vestibulum ipsum posuere ut. Cras facilisis sem id maximus consectetur. Proin vitae lacinia lorem, iaculis porta massa. Morbi risus sem, scelerisque nec maximus et, fringilla et sem. Mauris id risus malesuada, ullamcorper lacus faucibus, molestie nisi. Mauris et magna ligula. Fusce ipsum nulla, iaculis eu turpis vel, bibendum auctor lorem. Sed a dui tincidunt, pharetra augue eget, mollis nisl. Morbi nec orci eu quam ultrices aliquam. Sed vel enim sit amet ante convallis euismod vel sed massa. Nullam varius ullamcorper dui. Nam sollicitudin sodales metus, id vestibulum ipsum posuere ut. Cras facilisis sem id maximus consectetur. Proin vitae lacinia lorem, iaculis porta massa. Morbi risus sem, scelerisque nec maximus et, fringilla et sem. Mauris id risus malesuada, ullamcorper lacus faucibus, molestie nisi. Mauris et magna ligula. Fusce ipsum nulla, iaculis eu turpis vel, bibendum auctor lorem. Sed a dui tincidunt, pharetra augue eget, mollis nisl. Morbi nec orci eu quam ultrices aliquam. Sed vel enim sit amet ante convallis euismod vel sed massa.",
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: KColor.white.color,
          ),
        ],
      ),
    );
  }
}
