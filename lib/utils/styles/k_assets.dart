enum KAssetName {
  appIconPng,
  tixeAppIconPng,
  warJpg,
  icHeartRatePng,
  dummyMapLocationPng,
  icStepsPng,
  icInstructionPng,
  icWalletPng,
  dummyUserPng,
  icCheckboxPng,
  selectedRadioPng,
  icWalkingPng,
  icHeartRateGraphPng,
  icForwardFilledPng,
  dummyGearPng,
  icCaloriesPng,
  homePng,
  tixeLogoPng,
  icClockPng,
  applePng,
  icFirePng,
  icVideoPng,
  icBedtimePng,
  icExcercisePng,
  icArmStorePng,
  errorPng,
  icCalenderYellowPng,
  icSunrisePng,
  icHamburgerPng,
  icVideoPlayPng,
  fitnessPng,
  icClosePng,
  trainingPng,
  starPng,
  pdfPlaceholderPng,
  treadMillPng,
  unselectedRadioPng,
  demoTrainingPng,
  googlePng,
  facebookPng,
  tixeMainBgPng,
  icBackFilledPng,
  icPreferencePng,
  workoutPng,
  icCompletePng,
  splashBgPng,
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
      case KAssetName.warJpg:
        return '$_imagesDir/war.jpg';
      case KAssetName.icHeartRatePng:
        return '$_imagesDir/icHeartRate.png';
      case KAssetName.dummyMapLocationPng:
        return '$_imagesDir/dummy_map_location.png';
      case KAssetName.icStepsPng:
        return '$_imagesDir/icSteps.png';
      case KAssetName.icInstructionPng:
        return '$_imagesDir/icInstruction.png';
      case KAssetName.icWalletPng:
        return '$_imagesDir/icWallet.png';
      case KAssetName.dummyUserPng:
        return '$_imagesDir/dummy_user.png';
      case KAssetName.icCheckboxPng:
        return '$_imagesDir/icCheckbox.png';
      case KAssetName.selectedRadioPng:
        return '$_imagesDir/selectedRadio.png';
      case KAssetName.icWalkingPng:
        return '$_imagesDir/icWalking.png';
      case KAssetName.icHeartRateGraphPng:
        return '$_imagesDir/icHeartRateGraph.png';
      case KAssetName.icForwardFilledPng:
        return '$_imagesDir/icForwardFilled.png';
      case KAssetName.dummyGearPng:
        return '$_imagesDir/dummy_gear.png';
      case KAssetName.icCaloriesPng:
        return '$_imagesDir/icCalories.png';
      case KAssetName.homePng:
        return '$_imagesDir/home.png';
      case KAssetName.tixeLogoPng:
        return '$_imagesDir/tixe_logo.png';
      case KAssetName.icClockPng:
        return '$_imagesDir/icClock.png';
      case KAssetName.applePng:
        return '$_imagesDir/apple.png';
      case KAssetName.icFirePng:
        return '$_imagesDir/icFire.png';
      case KAssetName.icVideoPng:
        return '$_imagesDir/icVideo.png';
      case KAssetName.icBedtimePng:
        return '$_imagesDir/icBedtime.png';
      case KAssetName.icExcercisePng:
        return '$_imagesDir/icExcercise.png';
      case KAssetName.icArmStorePng:
        return '$_imagesDir/icArmStore.png';
      case KAssetName.errorPng:
        return '$_imagesDir/error.png';
      case KAssetName.icCalenderYellowPng:
        return '$_imagesDir/icCalenderYellow.png';
      case KAssetName.icSunrisePng:
        return '$_imagesDir/icSunrise.png';
      case KAssetName.icHamburgerPng:
        return '$_imagesDir/icHamburger.png';
      case KAssetName.icVideoPlayPng:
        return '$_imagesDir/icVideoPlay.png';
      case KAssetName.fitnessPng:
        return '$_imagesDir/fitness.png';
      case KAssetName.icClosePng:
        return '$_imagesDir/icClose.png';
      case KAssetName.trainingPng:
        return '$_imagesDir/training.png';
      case KAssetName.starPng:
        return '$_imagesDir/star.png';
      case KAssetName.pdfPlaceholderPng:
        return '$_imagesDir/pdfPlaceholder.png';
      case KAssetName.treadMillPng:
        return '$_imagesDir/treadMill.png';
      case KAssetName.unselectedRadioPng:
        return '$_imagesDir/unselectedRadio.png';
      case KAssetName.demoTrainingPng:
        return '$_imagesDir/demo_training.png';
      case KAssetName.googlePng:
        return '$_imagesDir/google.png';
      case KAssetName.facebookPng:
        return '$_imagesDir/facebook.png';
      case KAssetName.tixeMainBgPng:
        return '$_imagesDir/tixe_main_bg.png';
      case KAssetName.icBackFilledPng:
        return '$_imagesDir/icBackFilled.png';
      case KAssetName.icPreferencePng:
        return '$_imagesDir/icPreference.png';
      case KAssetName.workoutPng:
        return '$_imagesDir/workout.png';
      case KAssetName.icCompletePng:
        return '$_imagesDir/icComplete.png';
      case KAssetName.splashBgPng:
        return '$_imagesDir/splash_bg.png';
    }
  }
}
