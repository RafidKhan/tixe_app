import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/home/views/home_screen.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'components/dashboard_bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
    ];
    return Scaffold(
      extendBody: true,
      body: Container(
        height: context.height,
        width: context.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(KAssetName.tixeMainBgPng.imagePath),
            fit: BoxFit.fill,
          ),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            final state = ref.watch(dashboardController);
            return screens[state.selectedIndex];
          },
        ),
      ),
      bottomNavigationBar: const DashboardBottomNavBar(),
    );
  }
}
