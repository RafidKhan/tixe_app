import 'package:riverpod/riverpod.dart';
import 'package:tixe_app/modules/boilerplate/controller/state/boilerplate_state.dart';
import 'package:tixe_app/modules/boilerplate/repository/boilerplate_interface.dart';
import 'package:tixe_app/modules/boilerplate/repository/boilerplate_repository.dart';
import 'package:tixe_app/modules/splash/controller/state/splash_state.dart';
import 'package:tixe_app/modules/splash/repository/splash_interface.dart';
import 'package:tixe_app/modules/splash/repository/splash_repository.dart';

final splashController =
    StateNotifierProvider.autoDispose<SplashController, SplashState>(
        (ref) => SplashController());

class SplashController extends StateNotifier<SplashState> {
  final ISplashRepository _splashRepository = SplashRepository();

  SplashController() : super(SplashState());
}
