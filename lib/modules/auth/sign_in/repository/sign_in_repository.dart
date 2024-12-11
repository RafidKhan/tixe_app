import 'sign_in_api.dart';
import 'sign_in_interface.dart';

class SignInRepository implements ISignInRepository {
  final _api = SignInApi();
}
