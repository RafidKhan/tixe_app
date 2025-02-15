import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_flutter_app/global/widget/global_menu_icon.dart';
import 'package:tixe_flutter_app/global/widget/global_text.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class FitnessHeader extends StatelessWidget {
  const FitnessHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GlobalText(
            str: "Fitness",
            style: GoogleFonts.squadaOne(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: KColor.white.color,
            ),
          ),
        ),
        const GlobalMenuIcon(),
      ],
    );
  }
}
