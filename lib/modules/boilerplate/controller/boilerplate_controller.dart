import 'package:riverpod/riverpod.dart';
import 'package:tixe_app/modules/boilerplate/controller/state/boilerplate_state.dart';
import 'package:tixe_app/modules/boilerplate/repository/boilerplate_interface.dart';
import 'package:tixe_app/modules/boilerplate/repository/boilerplate_repository.dart';

final boilerplateController =
    StateNotifierProvider.autoDispose<BoilerplateController, BoilerplateState>(
        (ref) => BoilerplateController());

class BoilerplateController extends StateNotifier<BoilerplateState> {
  final IBoilerplateRepository _boilerplateRepository = BoilerplateRepository();

  BoilerplateController() : super(BoilerplateState());
}
