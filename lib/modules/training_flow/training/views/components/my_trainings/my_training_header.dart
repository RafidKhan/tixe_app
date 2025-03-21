import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

import '../../../../../../global/widget/global_menu_icon.dart';
import '../../../../../../utils/navigation.dart';

class MyTrainingHeader extends StatelessWidget {
  const MyTrainingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigation.pop(),
          child: Icon(Icons.arrow_back_ios, color: KColor.white.color),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: GlobalText(
            str: context.loc.my_trainings,
            style: GoogleFonts.squadaOne(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: KColor.white.color,
            ),
          ),
        ),
        const GlobalMenuIcon()
      ],
    );
  }
}
