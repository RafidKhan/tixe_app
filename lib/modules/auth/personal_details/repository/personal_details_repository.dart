import 'personal_details_api.dart';
import 'personal_details_interface.dart';

class PersonalDetailsRepository implements IPersonalDetailsRepository {
  final _api = PersonalDetailsApi();
}
