enum KAssetName {
  tixeLogoPng,
  applePng,
  errorPng,
  googlePng,
  facebookPng,
  splashBgPng,
}

extension AssetsExtension on KAssetName {
  String get imagePath {
    const String _rootPath = 'assets';
  const String _imagesDir = '$_rootPath/images';
    switch (this) {
      case KAssetName.tixeLogoPng:
        return '$_imagesDir/tixe_logo.png';
      case KAssetName.applePng:
        return '$_imagesDir/apple.png';
      case KAssetName.errorPng:
        return '$_imagesDir/error.png';
      case KAssetName.googlePng:
        return '$_imagesDir/google.png';
      case KAssetName.facebookPng:
        return '$_imagesDir/facebook.png';
      case KAssetName.splashBgPng:
        return '$_imagesDir/splash_bg.png';
    }
  }
}
