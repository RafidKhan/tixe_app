import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';

import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListWorkoutModulesScreen extends StatelessWidget {
  final int id;

  const ListWorkoutModulesScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TixeMainScaffold(
      hasAppBar: true,
      body: Column(
        children: [

        ],
      ),
    );
  }
}
