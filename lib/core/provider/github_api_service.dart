import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class GitHubApiService {
  final baseApi = 'https://api.github.com';

  Future findUserRepositories(String name) async {
    var jsonResponse;
    var url = Uri.parse('$baseApi/users/$name/repos');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonResponse = convert.jsonDecode(response.body) as List;
    } else {
      return jsonResponse = response.statusCode;
    }
  }

  Future listGithubUser({String? uName, String? dLink}) async {
    uName = uName == null ? '' : uName = '/$uName';
    dLink = dLink == null ? '' : dLink = '/$dLink';

    var jsonResponse;
    var url = Uri.parse('$baseApi/users/$uName$dLink');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonResponse = convert.jsonDecode(response.body) as List;
    } else {
      return jsonResponse = response.statusCode;
    }
  }
}
