import 'package:flutter/material.dart';
import 'package:tixe_app/modules/sign_in/views/sign_in_screen.dart';
import 'package:tixe_app/modules/sign_up/views/sign_up_screen.dart';
import '../modules/dashboard/views/dashboard_screen.dart';

enum AppRoutes {
  dashboard,
  signIn,
  signUp,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.dashboard:
        return const DashboardScreen();
      case AppRoutes.signIn:
        return const SignInScreen();
      case AppRoutes.signUp:
        return const SignUpScreen();
    }
  }
}
