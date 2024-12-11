import 'package:flutter/material.dart';
import 'package:tixe_app/modules/auth/sign_in/views/sign_in_screen.dart';
import 'package:tixe_app/modules/auth/sign_up/views/sign_up_screen.dart';
import 'package:tixe_app/modules/auth/verify_email/views/verify_email_screen.dart';
import '../modules/dashboard/views/dashboard_screen.dart';

enum AppRoutes {
  dashboard,
  signIn,
  signUp,
  verifyEmail,
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
      case AppRoutes.verifyEmail:
        return const VerifyEmailScreen();
    }
  }
}
