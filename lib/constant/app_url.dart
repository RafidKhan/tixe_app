import 'package:tixe_flutter_app/utils/enum.dart';

enum AppUrl {
  base,
  baseImage,
  login,
  registration,
  verifyRegistrationCode,
  resendRegistrationVerificationCode,
  registrationPersonalDetails,
  registrationFitnessDetails,
  settings,
  socialLogin,
  homeData,
  trainingDetails,
}

extension AppUrlExtention on AppUrl {
  static String _baseUrl = "";
  static String _baseImageUrl = "";

  static void setUrl(UrlLink urlLink) {
    switch (urlLink) {
      case UrlLink.isLive:
        _baseUrl = "";
        _baseImageUrl = "";

        break;

      case UrlLink.isDev:
        _baseUrl = "https://tixeapp.sagsio.com/api/";
        _baseImageUrl = "";

        break;
      case UrlLink.isLocalServer:
        // set up your local server ip address.
        _baseUrl = "";
        break;
    }
  }

  String get url {
    switch (this) {
      case AppUrl.base:
        return _baseUrl;
      case AppUrl.baseImage:
        return _baseImageUrl;
      case AppUrl.login:
        return "login";
      case AppUrl.registration:
        return "register";
      case AppUrl.verifyRegistrationCode:
        return "verify-code";
      case AppUrl.resendRegistrationVerificationCode:
        return "regenerate-code";
      case AppUrl.registrationPersonalDetails:
        return "user/personal-details/update";
      case AppUrl.registrationFitnessDetails:
        return "user/fitness-details/update";
      case AppUrl.settings:
        return "setting";
      case AppUrl.socialLogin:
        return "social/login";
      case AppUrl.homeData:
        return "home?page_size=15&page={PAGE}";
      case AppUrl.trainingDetails:
        return "training-services/{ID}";
    }
  }
}
