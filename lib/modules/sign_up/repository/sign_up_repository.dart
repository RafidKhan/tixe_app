import 'sign_up_api.dart';
import 'sign_up_interface.dart';

class SignUpRepository implements ISignUpRepository {
  final _api = SignUpApi();
}
