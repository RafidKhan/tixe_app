import '/global/widget/global_appbar.dart';
import '/global/widget/global_text.dart';
import 'package:flutter/material.dart';

class MyArmDetailScreen extends StatelessWidget {
  final int id;
  const MyArmDetailScreen({super.key,required this.id,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: "Myarmdetail",
      ),
      body: const Center(
        child: GlobalText(str: "Myarmdetail Setup"),
      ),
    );
  }
}



