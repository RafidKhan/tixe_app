import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/utils/styles/k_colors.dart';

class GlobalCircularLoader extends StatelessWidget {
  const GlobalCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: KColor.grey.color,
        valueColor: AlwaysStoppedAnimation<Color>(KColor.primary.color),
      ),
    );
  }
}
