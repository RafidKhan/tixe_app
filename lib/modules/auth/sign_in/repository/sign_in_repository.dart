import '../model/sign_in_response.dart';
import 'sign_in_api.dart';
import 'sign_in_interface.dart';

class SignInRepository implements ISignInRepository {
  final _api = SignInApi();

  @override
  Future<void> signInUser({
    required String email,
    required String password,
    required Function(SignInResponse? data, bool isSuccess) callback,
  }) async {
    await _api.signInUser(
        email: email,
        password: password,
        callback: (response, isSuccess) {
          if (isSuccess) {
            callback(
              SignInResponse.fromJson(response?.data),
              isSuccess,
            );
          } else {
            callback(
              null,
              isSuccess,
            );
          }
        });
  }
}
