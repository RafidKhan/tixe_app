import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//localization
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tixe_app/constant/app_url.dart';
import 'package:tixe_app/data_provider/pref_helper.dart';
import 'package:tixe_app/modules/splash/views/splash_screen.dart';
import 'package:tixe_app/utils/app_version.dart';
import 'package:tixe_app/utils/enum.dart';
import 'package:tixe_app/utils/navigation.dart';
import 'package:tixe_app/utils/network_connection.dart';
import 'package:tixe_app/utils/styles/k_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   await Firebase.initializeApp();
  // } else {
  //   await Firebase.initializeApp(
  //     options: const FirebaseOptions(
  //       apiKey: "AIzaSyBRMKTGwllqgOTDin-LKU97plkz3vM-kx8",
  //       appId: "1:456262419957:ios:19ba8f55cd08f68d46ccbc",
  //       messagingSenderId: "456262419957",
  //       projectId: "cashbaba-firebase",
  //     ),
  //   );
  // }
  await initServices();
  //Set Potraite Mode only
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// Make sure you always init shared pref first. It has token and token is need
/// to make API call
/// to make API call
initServices() async {
  const UrlLink urlLink = UrlLink.isDev;
  AppUrlExtention.setUrl(urlLink);

  await PrefHelper.init();
  await AppVersion.getVersion();
  // if (Platform.isAndroid) {
  //   AppUrlExtention.setAndroidPackageName();
  // }
  await NetworkConnection.instance.internetAvailable();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    return ScreenUtilInit(
      //Change the height and Width based on design
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (ctx, child) {
        return MaterialApp(
          title: 'Tixe',
          navigatorKey: Navigation.key,
          debugShowCheckedModeBanner: false,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: (PrefHelper.getLanguage() == 1)
              ? const Locale('en', 'US')
              : const Locale('bn', 'BD'),
          theme: ThemeData(
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: KColor.primary.color,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(),
            primaryColor: KColor.primary.color,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: KColor.primary.color,
                ),
          ),
          builder: (context, widget) {
            return ScrollConfiguration(
              behavior: const ScrollBehaviorModified(),
              child: widget ?? const SizedBox(),
            );
          },
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
