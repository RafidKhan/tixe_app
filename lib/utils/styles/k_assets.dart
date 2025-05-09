enum KAssetName {
  appIconPng,
  tixeAppIconPng,
  addPhoto1Png,
  addPhoto2Png,
  applePng,
  demoTrainingPng,
  dummyGearPng,
  dummyMapLocationPng,
  dummyUserPng,
  errorPng,
  facebookPng,
  fitnessPng,
  googlePng,
  homePng,
  icArmStorePng,
  icBackFilledPng,
  icBedtimePng,
  icCalenderYellowPng,
  icCaloriesPng,
  icCartPng,
  icCategoriesPng,
  icCheckboxPng,
  icClockPng,
  icClosePng,
  icCompletePng,
  icCurrentLocationPng,
  icEditPng,
  icExcercisePng,
  icFirePng,
  icForwardFilledPng,
  icHamburgerPng,
  icHeartRatePng,
  icHeartRateGraphPng,
  icHeight2Png,
  icInstructionPng,
  icLocationPng,
  icNotificationPng,
  icPersonPng,
  icPreferencePng,
  icStarUnchekedPng,
  icStepsPng,
  icSunrisePng,
  icUnitsPng,
  icVideoPng,
  icVideoPlayPng,
  icWalkingPng,
  icWalletPng,
  icWeight2Png,
  listArmsPng,
  listTrainingPng,
  listWorkoutsPng,
  noTrainingPng,
  noArmsPng,
  noWorkoutPng,
  paymentSuccessPng,
  paymentCompletePng,
  pdfPlaceholderPng,
  selectedCheckBoxPng,
  selectedRadioPng,
  splashBgPng,
  starPng,
  stripePng,
  tixeLogoPng,
  tixeMainBgPng,
  trainingPng,
  treadMillPng,
  unSelectedCheckboxPng,
  unselectedRadioPng,
  updateImagePng,
  warJpg,
  workoutPng,
}

extension AssetsExtension on KAssetName {
  String get imagePath {
    const String _rootPath = 'assets';
  const String _app_iconDir = '$_rootPath/app_icon';
  const String _imagesDir = '$_rootPath/images';
    switch (this) {
      case KAssetName.appIconPng:
        return '$_app_iconDir/app_icon.png';
      case KAssetName.tixeAppIconPng:
        return '$_app_iconDir/tixe_app_icon.png';
      case KAssetName.addPhoto1Png:
        return '$_imagesDir/addPhoto1.png';
      case KAssetName.addPhoto2Png:
        return '$_imagesDir/addPhoto2.png';
      case KAssetName.applePng:
        return '$_imagesDir/apple.png';
      case KAssetName.demoTrainingPng:
        return '$_imagesDir/demo_training.png';
      case KAssetName.dummyGearPng:
        return '$_imagesDir/dummy_gear.png';
      case KAssetName.dummyMapLocationPng:
        return '$_imagesDir/dummy_map_location.png';
      case KAssetName.dummyUserPng:
        return '$_imagesDir/dummy_user.png';
      case KAssetName.errorPng:
        return '$_imagesDir/error.png';
      case KAssetName.facebookPng:
        return '$_imagesDir/facebook.png';
      case KAssetName.fitnessPng:
        return '$_imagesDir/fitness.png';
      case KAssetName.googlePng:
        return '$_imagesDir/google.png';
      case KAssetName.homePng:
        return '$_imagesDir/home.png';
      case KAssetName.icArmStorePng:
        return '$_imagesDir/icArmStore.png';
      case KAssetName.icBackFilledPng:
        return '$_imagesDir/icBackFilled.png';
      case KAssetName.icBedtimePng:
        return '$_imagesDir/icBedtime.png';
      case KAssetName.icCalenderYellowPng:
        return '$_imagesDir/icCalenderYellow.png';
      case KAssetName.icCaloriesPng:
        return '$_imagesDir/icCalories.png';
      case KAssetName.icCartPng:
        return '$_imagesDir/icCart.png';
      case KAssetName.icCategoriesPng:
        return '$_imagesDir/icCategories.png';
      case KAssetName.icCheckboxPng:
        return '$_imagesDir/icCheckbox.png';
      case KAssetName.icClockPng:
        return '$_imagesDir/icClock.png';
      case KAssetName.icClosePng:
        return '$_imagesDir/icClose.png';
      case KAssetName.icCompletePng:
        return '$_imagesDir/icComplete.png';
      case KAssetName.icCurrentLocationPng:
        return '$_imagesDir/icCurrentLocation.png';
      case KAssetName.icEditPng:
        return '$_imagesDir/icEdit.png';
      case KAssetName.icExcercisePng:
        return '$_imagesDir/icExcercise.png';
      case KAssetName.icFirePng:
        return '$_imagesDir/icFire.png';
      case KAssetName.icForwardFilledPng:
        return '$_imagesDir/icForwardFilled.png';
      case KAssetName.icHamburgerPng:
        return '$_imagesDir/icHamburger.png';
      case KAssetName.icHeartRatePng:
        return '$_imagesDir/icHeartRate.png';
      case KAssetName.icHeartRateGraphPng:
        return '$_imagesDir/icHeartRateGraph.png';
      case KAssetName.icHeight2Png:
        return '$_imagesDir/icHeight2.png';
      case KAssetName.icInstructionPng:
        return '$_imagesDir/icInstruction.png';
      case KAssetName.icLocationPng:
        return '$_imagesDir/icLocation.png';
      case KAssetName.icNotificationPng:
        return '$_imagesDir/icNotification.png';
      case KAssetName.icPersonPng:
        return '$_imagesDir/icPerson.png';
      case KAssetName.icPreferencePng:
        return '$_imagesDir/icPreference.png';
      case KAssetName.icStarUnchekedPng:
        return '$_imagesDir/icStarUncheked.png';
      case KAssetName.icStepsPng:
        return '$_imagesDir/icSteps.png';
      case KAssetName.icSunrisePng:
        return '$_imagesDir/icSunrise.png';
      case KAssetName.icUnitsPng:
        return '$_imagesDir/icUnits.png';
      case KAssetName.icVideoPng:
        return '$_imagesDir/icVideo.png';
      case KAssetName.icVideoPlayPng:
        return '$_imagesDir/icVideoPlay.png';
      case KAssetName.icWalkingPng:
        return '$_imagesDir/icWalking.png';
      case KAssetName.icWalletPng:
        return '$_imagesDir/icWallet.png';
      case KAssetName.icWeight2Png:
        return '$_imagesDir/icWeight2.png';
      case KAssetName.listArmsPng:
        return '$_imagesDir/list_arms.png';
      case KAssetName.listTrainingPng:
        return '$_imagesDir/list_training.png';
      case KAssetName.listWorkoutsPng:
        return '$_imagesDir/list_workouts.png';
      case KAssetName.noTrainingPng:
        return '$_imagesDir/noTraining.png';
      case KAssetName.noArmsPng:
        return '$_imagesDir/no_arms.png';
      case KAssetName.noWorkoutPng:
        return '$_imagesDir/no_workout.png';
      case KAssetName.paymentSuccessPng:
        return '$_imagesDir/paymentSuccess.png';
      case KAssetName.paymentCompletePng:
        return '$_imagesDir/payment_complete.png';
      case KAssetName.pdfPlaceholderPng:
        return '$_imagesDir/pdfPlaceholder.png';
      case KAssetName.selectedCheckBoxPng:
        return '$_imagesDir/selectedCheckBox.png';
      case KAssetName.selectedRadioPng:
        return '$_imagesDir/selectedRadio.png';
      case KAssetName.splashBgPng:
        return '$_imagesDir/splash_bg.png';
      case KAssetName.starPng:
        return '$_imagesDir/star.png';
      case KAssetName.stripePng:
        return '$_imagesDir/stripe.png';
      case KAssetName.tixeLogoPng:
        return '$_imagesDir/tixe_logo.png';
      case KAssetName.tixeMainBgPng:
        return '$_imagesDir/tixe_main_bg.png';
      case KAssetName.trainingPng:
        return '$_imagesDir/training.png';
      case KAssetName.treadMillPng:
        return '$_imagesDir/treadMill.png';
      case KAssetName.unSelectedCheckboxPng:
        return '$_imagesDir/unSelectedCheckbox.png';
      case KAssetName.unselectedRadioPng:
        return '$_imagesDir/unselectedRadio.png';
      case KAssetName.updateImagePng:
        return '$_imagesDir/update_image.png';
      case KAssetName.warJpg:
        return '$_imagesDir/war.jpg';
      case KAssetName.workoutPng:
        return '$_imagesDir/workout.png';
    }
  }
}
