import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class UserPreferences {
  Future<bool> saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('userId', user.userId ?? '');
    prefs.setString('secureId', user.secureId ?? '');
    prefs.setString('name', user.name ?? '');
    prefs.setString('email', user.email ?? '');
    prefs.setString('token', user.token ?? '');
    prefs.setString('userType', user.userType ?? '');

    print("object prefere");
    return true;
  }

  Future<User> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString('userId');
    String? name = prefs.getString('name');
    String? email = prefs.getString('email');
    String? token = prefs.getString('token');
    String? userType = prefs.getString('userType');
    String? secureId = prefs.getString('secureId');

    return User(
      userId: userId ?? '',
      name: name ?? '',
      email: email ?? '',
      token: token ?? '',
      userType: userType ?? '',
      secureId: secureId ?? '',
    );
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.remove("userId");
    prefs.remove("name");
    prefs.remove("email");
    prefs.remove("token");
    prefs.remove('userType');
    prefs.remove('secureId');
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }
}
