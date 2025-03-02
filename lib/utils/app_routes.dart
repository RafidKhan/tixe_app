import 'package:tixe_flutter_app/modules/auth/personal_details/model/personal_detail_nav_model.dart';
import 'package:tixe_flutter_app/modules/review_flow/submit_review/model/submit_review_nav_model.dart';

import '../modules/review_flow/review/model/review_nav_model.dart';
import '../modules/review_flow/submit_review/views/submit_review_screen.dart';
import '../modules/review_flow/review/views/review_screen.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/views/personal_details_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/views/sign_in_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/views/sign_up_screen.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/views/verify_email_screen.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/add_alarm/model/add_alarm_nav_model.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/exercise_detail/views/exercise_detail_screen.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/fitness_screen.dart';
import 'package:tixe_flutter_app/modules/splash/views/splash_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/confirm_training_enroll/model/confirm_training_enrollment_nav_model.dart';
import 'package:tixe_flutter_app/modules/training_flow/my_training_details/views/my_training_details_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/model/my_trainings_response.dart';
import 'package:tixe_flutter_app/modules/training_flow/training/views/components/my_trainings/my_trainings_screen.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_details/model/training_details_nav_model.dart';
import 'package:tixe_flutter_app/modules/training_flow/training_gears_checklist/model/training_gears_checklist_nav_model.dart';
import 'package:tixe_flutter_app/modules/workout_flow/buy_workout/views/buy_workout_screen.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_detail/views/components/history/all_workout_history.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_pdf/views/my_workout_pdf_screen.dart';
import 'package:tixe_flutter_app/modules/workout_flow/my_workout_video/views/my_workout_video_screen.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/views/components/my_workouts/my_workouts_screen.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout/views/workout_screen.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_detail_response.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/model/workout_details_nav_model.dart';
import 'package:tixe_flutter_app/modules/workout_flow/workout_details/views/workout_details_screen.dart';

import '../modules/arm_store/views/arm_store_screen.dart';
import '../modules/auth/fitness_details/views/fitness_details_screen.dart';
import '../modules/dashboard/views/dashboard_screen.dart';
import '../modules/fitness_flow/add_alarm/views/add_alarm_screen.dart';
import '../modules/fitness_flow/sleep_and_alarm/views/sleep_and_alarm_screen.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/profile_flow/preferences/views/preferences_screen.dart';
import '../modules/profile_flow/profile/views/profile_screen.dart';
import '../modules/profile_flow/profile_details/views/profile_details_screen.dart';
import '../modules/training_flow/confirm_training_enroll/views/confirm_training_enroll_screen.dart';
import '../modules/training_flow/training/views/training_screen.dart';
import '../modules/training_flow/training_details/views/training_details_screen.dart';
import '../modules/training_flow/training_enrollment/model/training_enrollment_nav_model.dart';
import '../modules/training_flow/training_enrollment/views/training_enrollment_screen.dart';
import '../modules/training_flow/training_gears_checklist/views/training_gears_checklist_screen.dart';
import '../modules/workout_flow/my_workout_detail/model/my_enrolled_workout_detail_response.dart';
import '../modules/workout_flow/my_workout_detail/views/my_workout_detail_screen.dart';
import '../modules/workout_flow/my_workout_select_phase/views/my_workout_select_phase_screen.dart';

enum AppRoutes {
  splash,
  submitReview,
  review,
  preferences,
  armStore,
  profileDetails,
  addAlarm,
  sleepAndAlarm,
  exerciseDetail,
  profile,
  myWorkoutVideo,
  myWorkoutPdf,
  myWorkoutSelectPhase,
  myWorkoutDetail,
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
  myWorkouts,
  allWorkoutHistory,
  fitness,
}

extension AppRoutesExtention on AppRoutes {
  Widget buildWidget<T extends Object>({T? arguments}) {
    switch (this) {

      case AppRoutes.submitReview:
        return  SubmitReviewScreen(navModel: arguments as SubmitReviewNavModel,);
     case AppRoutes.review:
        return  ReviewScreen(navModel: arguments as ReviewNavModel,);
      case AppRoutes.preferences:
        return const PreferencesScreen();

      case AppRoutes.armStore:
        return const ArmStoreScreen();
      case AppRoutes.profileDetails:
        return const ProfileDetailsScreen();
      case AppRoutes.addAlarm:
        return  AddAlarmScreen(model: arguments as AddAlarmNavModel?,);

      case AppRoutes.sleepAndAlarm:
        return const SleepAndAlarmScreen();
     case AppRoutes.exerciseDetail:
        return const ExerciseDetailScreen();
     case AppRoutes.profile:
        return const ProfileScreen();
      case AppRoutes.myWorkoutVideo:
        return MyWorkoutVideoScreen(
          phase: arguments as WorkoutPhase,
        );
      case AppRoutes.myWorkoutPdf:
        return MyWorkoutPdfScreen(
          phase: arguments as WorkoutPhase,
        );
      case AppRoutes.myWorkoutSelectPhase:
        return MyWorkoutSelectPhaseScreen(
          model: arguments as MyWorkoutData,
        );
      case AppRoutes.myWorkoutDetail:
        return MyWorkoutDetailScreen(
          id: arguments as int,
        );
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
          model: arguments as PersonalDetailsNavModel,
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
          model: arguments as PersonalDetailsNavModel,
        );
      case AppRoutes.myTrainings:
        return const MyTrainingsScreen();
      case AppRoutes.myTrainingDetails:
        return MyTrainingDetailsScreen(model: arguments as MyTrainingData);
      case AppRoutes.myWorkouts:
        return const MyWorkoutsScreen();
      case AppRoutes.allWorkoutHistory:
        return const AllWorkoutHistory();
      case AppRoutes.fitness:
        return const FitnessScreen();
    }
  }
}
