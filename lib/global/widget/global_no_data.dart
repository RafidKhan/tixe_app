import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalNoData extends StatelessWidget {
  const GlobalNoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlobalText(
        str: context.loc.no_data_found,
        style: GoogleFonts.squadaOne(
          color: KColor.white.color,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
