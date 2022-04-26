import 'dart:convert';
import 'package:github_flutter_bloc/modules/model/github_profile_model.dart';
import 'package:github_flutter_bloc/modules/model/github_repositories_model.dart';
import 'package:github_flutter_bloc/modules/model/search_result_error.dart';

import 'package:http/http.dart' as http;

class GitHubApiService {
  final baseApi = 'https://api.github.com';

  Future<List<GitHubRepositoriesModel>> findUserRepositories(
      String name) async {
    var url = Uri.parse('$baseApi/users/$name/repos');

    final response = await http.get(url);
    final result = json.decode(response.body);

    if (response.statusCode == 200) {
      List<GitHubRepositoriesModel> _lst =
          gitHubRepositoriesModelFromJson(response.body);
      return _lst;
      // return RepoSearch.fromJson(result);
    } else {
      throw SearchResultError.fromJson(result);
    }
  }

  Future<List<GitHubProfileModel>> listGithubUser(
      {String? uName, String? dataLink}) async {
    uName = uName == null ? '' : uName = '/$uName';
    dataLink = dataLink == null ? '' : dataLink = '/$dataLink';

    var url = Uri.parse('$baseApi/users/$uName$dataLink');

    final response = await http.get(url);
    final result = json.decode(response.body);

    if (response.statusCode == 200) {
      List<GitHubProfileModel> _lst = gitHubProfileModelFromJson(response.body);
      return _lst;
    } else {
      throw SearchResultError.fromJson(result);
    }
  }
}
