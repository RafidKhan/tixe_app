import 'package:flutter/material.dart';

import '/utils/app_routes.dart';

class Navigation {
  static GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// Holds the information about parent context
  /// For example when navigation from Screen A to Screen B
  /// we can access context of Screen A from Screen B to check if it
  /// came from Screen A. So we can trigger different logic depending on
  /// which screen we navigated from.

  //it will navigate you to one screen to another
  static Future push<T extends Object>({
    required AppRoutes appRoutes,
    String? routeName,
    T? arguments,
  }) async {
    return await Navigator.push(
      Navigation.key.currentContext!,
      PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (context, animation, secondaryAnimation) =>
            appRoutes.buildWidget(
          arguments: arguments,
        ),
        transitionsBuilder: slideTransition,
      ),
    );
  }

  static SlideTransition slideTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    const begin = Offset(1.0, 0.0); // Start from the right
    const end = Offset.zero; // End at center (no offset)
    const curve = Curves.easeInOut;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    // Apply SlideTransition using the tween animation
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }

  //it will pop all the screen  and take you to the new screen
  //E:g : when you will goto the login to home page then you will use this
  static Future pushAndRemoveUntil<T extends Object>({
    required AppRoutes appRoutes,
    String? routeName,
    T? arguments,
  }) async {
    return await Navigator.pushAndRemoveUntil(
      Navigation.key.currentContext!,
      PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (context, animation, secondaryAnimation) =>
            appRoutes.buildWidget(
          arguments: arguments,
        ),
        transitionsBuilder: slideTransition,
      ),
      (route) => false,
    );
  }

  //It will replace the screen with current screen
  //E:g :  screen A
  //  GlobalInkWell(
  // onTap: (){
  //   ScreenB().pushReplacement
  // },
  // it means screen B replace in screen A .
  //if you pressed back then you will not find screen A. it remove from stack

  static Future pushReplacement<T extends Object>({
    required AppRoutes appRoutes,
    String? routeName,
    T? arguments,
  }) async {
    return await Navigator.pushReplacement(
      Navigation.key.currentContext!,
      PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (context, animation, secondaryAnimation) =>
            appRoutes.buildWidget(
          arguments: arguments,
        ),
        transitionsBuilder: slideTransition,
      ),
    );
  }

  //it will pop all the screen and take you to the first screen of the stack
  //that means you will go to the Home page
  static Future pushAndRemoveSpecificScreen<T extends Object>({
    required AppRoutes appRoutes,
    String? routeName,
    T? arguments,
  }) async {
    return await Navigator.pushAndRemoveUntil(
      Navigation.key.currentContext!,
      PageRouteBuilder(
        settings: RouteSettings(name: routeName),
        pageBuilder: (context, animation, secondaryAnimation) =>
            appRoutes.buildWidget(
          arguments: arguments,
        ),
        transitionsBuilder: slideTransition,
      ),
      (route) => route.isFirst,
    );
  }

  // when you remove previous x count of  route
  //from stack then please use this way
  //E.g : if you remove 3 route from stack then pass the argument to 3
  static popUntil(int removeProviousPage) {
    int screenPop = 0;
    return Navigator.of(Navigation.key.currentContext!)
        .popUntil((_) => screenPop++ >= removeProviousPage);
  }

  //Remove single page from stack
  static void pop<T extends Object?>({Object? result}) {
    return Navigator.pop(Navigation.key.currentContext!, result);
  }
}
