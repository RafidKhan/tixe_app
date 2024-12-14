enum KAssetName {
  warJpg,
  homePng,
  tixeLogoPng,
  applePng,
  errorPng,
  icHamburgerPng,
  fitnessPng,
  trainingPng,
  starPng,
  demoTrainingPng,
  googlePng,
  facebookPng,
  tixeMainBgPng,
  workoutPng,
  splashBgPng,
}

extension AssetsExtension on KAssetName {
  String get imagePath {
    const String _rootPath = 'assets';
  const String _imagesDir = '$_rootPath/images';
    switch (this) {
      case KAssetName.warJpg:
        return '$_imagesDir/war.jpg';
      case KAssetName.homePng:
        return '$_imagesDir/home.png';
      case KAssetName.tixeLogoPng:
        return '$_imagesDir/tixe_logo.png';
      case KAssetName.applePng:
        return '$_imagesDir/apple.png';
      case KAssetName.errorPng:
        return '$_imagesDir/error.png';
      case KAssetName.icHamburgerPng:
        return '$_imagesDir/icHamburger.png';
      case KAssetName.fitnessPng:
        return '$_imagesDir/fitness.png';
      case KAssetName.trainingPng:
        return '$_imagesDir/training.png';
      case KAssetName.starPng:
        return '$_imagesDir/star.png';
      case KAssetName.demoTrainingPng:
        return '$_imagesDir/demo_training.png';
      case KAssetName.googlePng:
        return '$_imagesDir/google.png';
      case KAssetName.facebookPng:
        return '$_imagesDir/facebook.png';
      case KAssetName.tixeMainBgPng:
        return '$_imagesDir/tixe_main_bg.png';
      case KAssetName.workoutPng:
        return '$_imagesDir/workout.png';
      case KAssetName.splashBgPng:
        return '$_imagesDir/splash_bg.png';
    }
  }
}
