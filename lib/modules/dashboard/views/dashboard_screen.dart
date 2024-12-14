import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/home/views/home_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/views/training_screen.dart';
import 'package:tixe_flutter_app/utils/extension.dart';
import 'package:tixe_flutter_app/utils/styles/k_assets.dart';
import 'components/dashboard_bottom_nav_bar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const TrainingScreen(),
      const SizedBox.shrink(),
      const SizedBox.shrink(),
    ];
    return TixeMainScaffold(
      extendBody: true,
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
