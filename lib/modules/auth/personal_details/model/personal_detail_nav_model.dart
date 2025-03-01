import 'package:tixe_flutter_app/global/model/profile_response.dart';
import 'package:tixe_flutter_app/utils/enum.dart';

class PersonalDetailsNavModel {
  final String email;
  final ActionType actionType;
  final ProfileResponse? profileResponse;

  const PersonalDetailsNavModel({
    required this.email,
    required this.actionType,
    this.profileResponse,
  });
}
