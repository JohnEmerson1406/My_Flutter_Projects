import 'package:flutter/cupertino.dart';
import 'package:github_following_app/Models/User.dart';

class UserProvider with ChangeNotifier {
  User user;
  String errorMessage;
  bool loading = false;

  Future<bool> fetchUser(username) async {
    setLoading(true);
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }
}
