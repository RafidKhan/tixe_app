import '../modules/arms_cart/views/arms_cart_screen.dart';
import 'package:tixe_flutter_app/modules/list_workout_form/views/list_workout_form_screen.dart';

import '../modules/arms_details/views/arms_details_screen.dart';
import 'package:tixe_flutter_app/modules/list_workouts/views/list_workouts_screen.dart';

import '../modules/my_listed_training_detail/views/my_listed_training_detail_screen.dart';
import '../modules/training_gear_select/views/training_gear_select_screen.dart';
import '../modules/training_selected_gears_list/views/training_selected_gears_list_screen.dart';
import '../modules/create_training_schedule/views/create_training_schedule_screen.dart';
import '../modules/list_training_schedules/views/list_training_schedules_screen.dart';
import '../modules/list_training_form/views/list_training_form_screen.dart';
import '../modules/list_training/views/list_training_screen.dart';
import '../modules/my_arm_detail/views/my_arm_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/model/personal_detail_nav_model.dart';
import 'package:tixe_flutter_app/modules/auth/personal_details/views/personal_details_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_in/views/sign_in_screen.dart';
import 'package:tixe_flutter_app/modules/auth/sign_up/views/sign_up_screen.dart';
import 'package:tixe_flutter_app/modules/auth/verify_email/views/verify_email_screen.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/add_alarm/model/add_alarm_nav_model.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/exercise_detail/views/exercise_detail_screen.dart';
import 'package:tixe_flutter_app/modules/fitness_flow/fitness/views/fitness_screen.dart';
import 'package:tixe_flutter_app/modules/listing_payment/model/listing_payment_nav_model.dart';
import 'package:tixe_flutter_app/modules/review_flow/submit_review/model/submit_review_nav_model.dart';
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
import '../modules/list_arms/views/list_arms_screen.dart';
import '../modules/list_arms_form/views/list_arms_form_screen.dart';
import '../modules/listing_payment/views/listing_payment_screen.dart';
import '../modules/listing_selection/views/listing_selection_screen.dart';
import '../modules/payment_success/views/payment_success_screen.dart';
import '../modules/profile_flow/preferences/views/preferences_screen.dart';
import '../modules/profile_flow/profile/views/profile_screen.dart';
import '../modules/profile_flow/profile_details/views/profile_details_screen.dart';
import '../modules/review_flow/review/model/review_nav_model.dart';
import '../modules/review_flow/review/views/review_screen.dart';
import '../modules/review_flow/submit_review/views/submit_review_screen.dart';
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
  armsCart,
  armsDetails,
  listWorkoutForm,
  listWorkouts,
  myListedTrainingDetail,
  trainingGearSelect,
  trainingSelectedGearsList,
  createTrainingSchedule,
  listTrainingSchedules,
  listTrainingForm,
  listTraining,
  myArmDetail,
  paymentSuccess,
  listingPayment,
  listArmsForm,
  listArms,
  listingSelection,
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

      case AppRoutes.listWorkoutForm:
        return const ListWorkoutFormScreen();
     case AppRoutes.listWorkouts:
        return const ListWorkoutsScreen();
     case AppRoutes.myListedTrainingDetail:
        return MyListedTrainingDetailScreen(id: arguments as int);
      case AppRoutes.trainingGearSelect:
        return TrainingGearSelectScreen(trainingId: arguments as int);

      case AppRoutes.trainingSelectedGearsList:
        return TrainingSelectedGearsListScreen(trainingId: arguments as int);
      case AppRoutes.createTrainingSchedule:
        return CreateTrainingScheduleScreen(trainingId: arguments as int);
      case AppRoutes.listTrainingSchedules:
        return ListTrainingSchedulesScreen(trainingId: arguments as int);
      case AppRoutes.listTrainingForm:
        return const ListTrainingFormScreen();
      case AppRoutes.listTraining:
        return const ListTrainingScreen();

      case AppRoutes.myArmDetail:
        return MyArmDetailScreen(
          id: arguments as int,
        );
      case AppRoutes.paymentSuccess:
        return PaymentSuccessScreen(
          model: arguments as ListingPaymentNavModel,
        );
      case AppRoutes.listingPayment:
        return ListingPaymentScreen(
          model: arguments as ListingPaymentNavModel,
        );

      case AppRoutes.listArmsForm:
        return const ListArmsFormScreen();
      case AppRoutes.listArms:
        return const ListArmsScreen();
      case AppRoutes.listingSelection:
        return const ListingSelectionScreen();
      case AppRoutes.submitReview:
        return SubmitReviewScreen(
          navModel: arguments as SubmitReviewNavModel,
        );
      case AppRoutes.review:
        return ReviewScreen(
          navModel: arguments as ReviewNavModel,
        );
      case AppRoutes.preferences:
        return const PreferencesScreen();

      case AppRoutes.armStore:
        return const ArmStoreScreen();
      case AppRoutes.profileDetails:
        return const ProfileDetailsScreen();
      case AppRoutes.addAlarm:
        return AddAlarmScreen(
          model: arguments as AddAlarmNavModel?,
        );

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
      case AppRoutes.armsDetails:
        return const ArmsDetailsScreen();
      case AppRoutes.armsCart:
        return const ArmsCartScreen();
    }
  }
}
