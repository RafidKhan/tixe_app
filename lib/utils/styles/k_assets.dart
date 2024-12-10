enum KAssetName {
  splashBg,
  tixeLogo,
  error,
  facebook,
  google,
  apple,
}

extension AssetsExtention on KAssetName {
  String get imagePath {
    String _rootPath = 'assets';
    String _svgDir = '$_rootPath/svg';
    String _imageDir = '$_rootPath/images';

    switch (this) {
      case KAssetName.splashBg:
        return "$_imageDir/splash_bg.png";
      case KAssetName.tixeLogo:
        return "$_imageDir/tixe_logo.png";
      case KAssetName.error:
        return "$_imageDir/error.png";
      case KAssetName.facebook:
        return "$_imageDir/facebook.png";
      case KAssetName.google:
        return "$_imageDir/google.png";
      case KAssetName.apple:
        return "$_imageDir/apple.png";

      default:
        return "";
    }
  }
}
