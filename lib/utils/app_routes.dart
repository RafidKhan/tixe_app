import '../modules/training_flow/training_details/views/training_details_screen.dart';
import '../modules/training_flow/training/views/training_screen.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/auth/fitness_details/views/fitness_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/views/personal_details_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/views/sign_in_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/views/sign_up_screen.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/views/verify_email_screen.dart';
import '../modules/dashboard/views/dashboard_screen.dart';

enum AppRoutes {
  dashboard,
  trainingDetails,
  training,
  home,
  fitnessDetails,
  signIn,
  signUp,
  verifyEmail,
  personalDetails,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {

      case AppRoutes.trainingDetails:
        return const TrainingDetailsScreen();
     case AppRoutes.training:
        return const TrainingScreen();
      case AppRoutes.home:
        return const HomeScreen();

      case AppRoutes.fitnessDetails:
        return const FitnessDetailsScreen();
     case AppRoutes.dashboard:
        return const DashboardScreen();
      case AppRoutes.signIn:
        return const SignInScreen();
      case AppRoutes.signUp:
        return const SignUpScreen();
      case AppRoutes.verifyEmail:
        return const VerifyEmailScreen();
      case AppRoutes.personalDetails:
        return const PersonalDetailsScreen();
    }
  }
}
