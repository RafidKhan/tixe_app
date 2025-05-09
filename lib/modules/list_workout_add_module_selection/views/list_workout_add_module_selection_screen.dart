import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class ListWorkoutAddModuleSelectionScreen extends StatelessWidget {
  const ListWorkoutAddModuleSelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Listworkoutaddmoduleselection",
      ),
      body: const Center(
        child: GlobalText(str: "Listworkoutaddmoduleselection Setup"),
      ),
    );
  }
}



