import 'package:flutter/material.dart';

class TixeMainScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? extendBody;

  const TixeMainScaffold({
    super.key,
    this.body,
    this.bottomNavigationBar,
    this.extendBody,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: extendBody??false,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
