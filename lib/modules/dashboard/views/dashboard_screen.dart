import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/data_provider/pref_helper.dart';
import 'package:tixe_flutter_app/global/global_module/shared/shared_controller.dart';
import 'package:tixe_flutter_app/global/widget/scaffold/tixe_main_scaffold.dart';
import 'package:tixe_flutter_app/modules/dashboard/controller/dashboard_controller.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/fitness_screen.dart';
import 'package:tixe_flutter_app/modules/home/views/home_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/views/training_screen.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/views/workout_screen.dart';
import 'package:tixe_flutter_app/utils/extension.dart';

import 'components/dashboard_bottom_nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = context.read(dashboardController.notifier);
    final sharedCon = context.read(sharedController.notifier);
    Future(() {
      controller.setSelectedIndex(0, context);
      sharedCon.getProfileData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const TrainingScreen(),
      const WorkoutScreen(),
      const FitnessScreen(),
      // Center(
      //   child: GlobalButton(
      //     onPressed: () {
      //       PrefHelper.logout();
      //       Navigation.pushAndRemoveUntil(appRoutes: AppRoutes.splash);
      //     },
      //     buttonText: "Logout",
      //   ),
      // )
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
