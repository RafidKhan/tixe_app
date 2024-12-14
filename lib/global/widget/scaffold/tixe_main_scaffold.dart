import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/global/widget/global_appbar.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';

class TixeMainScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? extendBody;
  final bool hasAppBar;

  const TixeMainScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.extendBody,
    this.hasAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody ?? false,
      appBar: hasAppBar
          ? GlobalAppBar(
              height: 0,
            )
          : null,
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(KAssetName.tixeMainBgPng.imagePath),
            fit: BoxFit.fill,
          ),
        ),
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
