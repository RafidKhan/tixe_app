import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyWorkoutVideoScreen extends StatelessWidget {
  const MyWorkoutVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Myworkoutvideo",
      ),
      body: const Center(
        child: GlobalText(str: "Myworkoutvideo Setup"),
      ),
    );
  }
}



