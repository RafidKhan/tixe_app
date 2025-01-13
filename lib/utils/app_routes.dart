import 'package:tixe_flutter_app/modules/workout_flow/buy_workout/views/buy_workout_screen.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_details_nav_model.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/views/workout_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/views/personal_details_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/views/sign_in_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/views/sign_up_screen.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/views/verify_email_screen.dart';
import 'package:tixe_flutter_app/modules/splash/views/splash_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_nav_model.dart';
import 'package:tixe_flutter_app/modules/training_flow/my_training_details/views/my_training_details_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/views/components/my_trainings/my_trainings_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_details_nav_model.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/training_gears_checklist_nav_model.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/views/workout_screen.dart';

import '../modules/auth/fitness_details/views/fitness_details_screen.dart';
import '../modules/dashboard/views/dashboard_screen.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/training_flow/confirm_training_enroll/views/confirm_training_enroll_screen.dart';
import '../modules/training_flow/training/views/training_screen.dart';
import '../modules/training_flow/training_details/views/training_details_screen.dart';
import '../modules/training_flow/training_enrollment/model/training_enrollment_nav_model.dart';
import '../modules/training_flow/training_enrollment/views/training_enrollment_screen.dart';
import '../modules/training_flow/training_gears_checklist/views/training_gears_checklist_screen.dart';

enum AppRoutes {
  splash,
  buyWorkout,
  workoutDetails,
  workout,
  dashboard,
  confirmTrainingEnroll,
  trainingGearsChecklist,
  trainingEnrollment,
  trainingDetails,
  training,
  home,
  fitnessDetails,
  signIn,
  signUp,
  verifyEmail,
  personalDetails,
  myTrainings,
  myTrainingDetails,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {
      case AppRoutes.buyWorkout:
        return BuyWorkoutScreen(
          model: arguments as WorkoutService,
        );
      case AppRoutes.workoutDetails:
        return WorkoutDetailsScreen(
          navModel: arguments as WorkoutDetailsNavModel,
        );
      case AppRoutes.workout:
        return const WorkoutScreen();
      case AppRoutes.splash:
        return const SplashScreen();
      case AppRoutes.confirmTrainingEnroll:
        return ConfirmTrainingEnrollScreen(
          model: arguments as ConfirmTrainingEnrollmentNavModel,
        );
      case AppRoutes.trainingGearsChecklist:
        return TrainingGearsChecklistScreen(
          model: arguments as TrainingGearsChecklistNavModel,
        );
      case AppRoutes.trainingEnrollment:
        return TrainingEnrollmentScreen(
          model: arguments as TrainingEnrollmentNavModel,
        );
      case AppRoutes.trainingDetails:
        return TrainingDetailsScreen(
          model: arguments as TrainingDetailsNavModel,
        );
      case AppRoutes.training:
        return const TrainingScreen();
      case AppRoutes.home:
        return const HomeScreen();

      case AppRoutes.fitnessDetails:
        return FitnessDetailsScreen(
          email: arguments as String,
        );
      case AppRoutes.dashboard:
        return const DashboardScreen();
      case AppRoutes.signIn:
        return const SignInScreen();
      case AppRoutes.signUp:
        return const SignUpScreen();
      case AppRoutes.verifyEmail:
        return VerifyEmailScreen(
          email: arguments as String,
        );
      case AppRoutes.personalDetails:
        return PersonalDetailsScreen(
          email: arguments as String,
        );
      case AppRoutes.myTrainings:
        return const MyTrainingsScreen();
      case AppRoutes.myTrainingDetails:
        return MyTrainingDetailsScreen(model: arguments as MyTrainingData);
    }
  }
}
