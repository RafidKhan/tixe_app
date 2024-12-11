import 'verify_email_api.dart';
import 'verify_email_interface.dart';

class VerifyEmailRepository implements IVerifyEmailRepository {
  final _api = VerifyEmailApi();
}
