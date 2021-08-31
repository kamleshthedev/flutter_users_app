import 'package:http/http.dart' as http;
import '../models/modes_index.dart';

class DataService {
  Future<List<User>> getUsers() async {
    try {
      final uri = Uri.https('jsonplaceholder.typicode.com', '/users');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<User> usersData = userFromJson(response.body);
        return usersData;
      } else {
        return List<User>.empty();
      }
    } catch (e) {
      return List<User>.empty();
    }
  }
}
