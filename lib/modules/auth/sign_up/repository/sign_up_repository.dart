import 'package:tixe_flutter_app/modules/auth/sign_up/model/sign_up_response.dart';

import 'sign_up_api.dart';
import 'sign_up_interface.dart';

class SignUpRepository implements ISignUpRepository {
  final _api = SignUpApi();

  @override
  Future<void> signUpUser({
    required String email,
    required String password,
    required String confirmPassword,
    required Function(SignUpResponse? data, bool isSuccess) callback,
  }) async {
    await _api.signUpUser(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      callback: (response, isSuccess) {
        callback(
          isSuccess ? SignUpResponse.fromJson(response?.data) : null,
          isSuccess,
        );
      },
    );
  }
}
