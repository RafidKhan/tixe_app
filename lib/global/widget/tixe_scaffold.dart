import 'package:flutter/material.dart';
import 'package:tixe_app/data_provider/api_client.dart';
import 'package:tixe_app/global/widget/global_appbar.dart';
import 'package:tixe_app/utils/extension.dart';
import 'package:tixe_app/utils/styles/styles.dart';

class TixeScaffold extends StatelessWidget {
  final Widget body;

  const TixeScaffold({
    super.key,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.transparent.color,
      appBar: GlobalAppBar(
        height: 0,
      ),
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              KColor.bodyGradient1.color,
              KColor.bodyGradient2.color,
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}
