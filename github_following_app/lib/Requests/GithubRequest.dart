import 'package:http/http.dart' as http;

class Github {
  final String userName;
  final String url = 'https://api.github.com/';
  static String client_id = '2a68e031a6fbf2876bd3';
  static String client_secret = 'e54d9c7848b12999ad20ad2f9e4a5a0076d8542d';

  final String query = '?client_id=${client_id}&client_secret=${client_secret}';

  Github(this.userName);

  Future<http.Response> fetchUser() {
    return http.get(url + 'users/' + userName + query);
  }

  Future<http.Response> fetchFollowing() {
    return http.get(url + 'users/' + userName + '/following' + query);
  }
}
