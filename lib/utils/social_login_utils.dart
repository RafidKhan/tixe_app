import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tixe_flutter_app/global/global_module/global_interface.dart';
import 'package:tixe_flutter_app/global/global_module/global_respository.dart';
import 'package:tixe_flutter_app/utils/navigation.dart';
import 'package:tixe_flutter_app/utils/network_connection.dart';
import 'package:tixe_flutter_app/utils/view_util.dart';

import '../constant/constant_key.dart';
import '../data_provider/pref_helper.dart';
import 'app_routes.dart';

class SocialLoginUtils {
  static SocialLoginUtils? _instance;

  SocialLoginUtils._();

  static SocialLoginUtils get instance => _instance ??= SocialLoginUtils._();

  final IGlobalRepository _globalRepository = GlobalRepository();

  Future<void> gmailLogin() async {
    try {
      ViewUtil.showLoaderPage();
      if (NetworkConnection.instance.isInternet) {
        final FirebaseAuth auth = FirebaseAuth.instance;

        final GoogleSignIn googleSignIn = GoogleSignIn();

        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();

        if (googleSignInAccount == null) {
          await ViewUtil.showError("Something went wrong");
          ViewUtil.hideLoader();
          return;
        }

        //if googleSignInAccount != null
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        ViewUtil.hideLoader();
        await Future.delayed(const Duration(milliseconds: 200), () async {
          final user = userCredential.user;
          await signInUser(
            email: user?.email ?? "",
            name: user?.displayName ?? "",
            client: "google",
            token: (userCredential.credential?.token ?? "").toString(),
          );
        });
        //onAuthentication(userCredential);
      } else {
        await ViewUtil.showError("No Internet Connection");
        ViewUtil.hideLoader();
      }
    } on FirebaseAuthException catch (e) {
      await ViewUtil.showError(e.message);
      ViewUtil.hideLoader();
    } on PlatformException catch (e) {
      await ViewUtil.showError(e.message);
      ViewUtil.hideLoader();
    } catch (e) {
      await ViewUtil.showError("Something went wrong");
      ViewUtil.hideLoader();
    }
  }

  Future<void> signInUser({
    required String email,
    required String name,
    required String client,
    required String token,
  }) async {
    ViewUtil.showLoaderPage();
    await _globalRepository.performSocialLogin(
      email: email,
      name: name,
      client: client,
      token: token,
      callback: (response, isSuccess) async {
        ViewUtil.hideLoader();
        if (isSuccess) {
          await PrefHelper.setString(
                  AppConstant.TOKEN.key, response?.token ?? "")
              .then(
            (value) {
              Navigation.pushAndRemoveUntil(
                appRoutes: AppRoutes.dashboard,
              );
            },
          );
        }
      },
    );
  }
}
