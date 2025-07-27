import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // To store name
  Future<void> saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  // To display name from local storage
  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    String? userName = prefs.getString("name");
    return userName;
  }
}
