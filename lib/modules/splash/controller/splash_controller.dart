import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tixe_flutter_app/modules/splash/controller/state/splash_state.dart';
import 'package:tixe_flutter_app/modules/splash/repository/splash_interface.dart';
import 'package:tixe_flutter_app/modules/splash/repository/splash_repository.dart';

final splashController =
    StateNotifierProvider.autoDispose<SplashController, SplashState>(
        (ref) => SplashController());

class SplashController extends StateNotifier<SplashState> {
  final ISplashRepository _splashRepository = SplashRepository();

  SplashController() : super(SplashState());
}
