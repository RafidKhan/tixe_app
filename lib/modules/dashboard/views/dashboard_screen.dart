import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'components/dashboard_bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const SizedBox.shrink(),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
    ];
    return Scaffold(
      body: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(dashboardController);
          return screens[state.selectedIndex];
        },
      ),
      bottomNavigationBar: const DashboardBottomNavBar(),
    );
  }
}
