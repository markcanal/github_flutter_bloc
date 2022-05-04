import 'dart:convert';
import 'package:github_flutter_bloc/modules/model/github_profile_model.dart';
import 'package:github_flutter_bloc/modules/model/github_repositories_model.dart';
import 'package:github_flutter_bloc/modules/model/github_user_follower.dart';
import 'package:github_flutter_bloc/modules/model/github_user_following.dart';
import 'package:github_flutter_bloc/modules/model/github_user_model.dart';
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

  Future<List<GitHubUserModel>> listGithubUser() async {
    // userName = userName == null ? '' : userName = '/$userName';
    // page = page == null ? '' : page = '/$page';

    var url = Uri.parse('$baseApi/users');

    final response = await http.get(url);
    final result = json.decode(response.body);

    if (response.statusCode == 200) {
      List<GitHubUserModel> _lst = gitHubUserModelFromJson(response.body);
      return _lst;
    } else {
      throw SearchResultError.fromJson(result);
    }
  }

  Future<GitHubProfileModel> userProfile(
      {String? userName, String? page}) async {
    userName = userName == null ? '' : userName = '/$userName';
    page = page == null ? '' : page = '/$page';

    var url = Uri.parse('$baseApi/users$userName$page');
    // print(url);
    final response = await http.get(url);
    final result = json.decode(response.body);
    // print(response.body);
    // print('##result $result');

    if (response.statusCode == 200) {
      return GitHubProfileModel.fromJson(result);
    } else {
      throw SearchResultError.fromJson(result);
    }
  }

  Future<List<GitHubFollowingModel>> userFollowing(
      {String? userName, String? page}) async {
    userName = userName == null ? '' : userName = '/$userName';
    page = page == null ? '' : page = '/$page';

    var url = Uri.parse('$baseApi/users$userName$page');
    // print(url);
    final response = await http.get(url);
    final result = json.decode(response.body);
    // print('##result $result');

    if (response.statusCode == 200) {
      List<GitHubFollowingModel> lst =
          gitHubFollowingModelFromJson(response.body);
      return lst;
    } else {
      throw SearchResultError.fromJson(result);
    }
  }

  Future<List<GitHubFollowerModel>> userFollower(
      {String? userName, String? page}) async {
    userName = userName == null ? '' : userName = '/$userName';
    page = page == null ? '' : page = '/$page';

    var url = Uri.parse('$baseApi/users$userName$page');
    // print('#Fllower $url');
    final response = await http.get(url);
    final result = json.decode(response.body);
    // print('##result $result');

    if (response.statusCode == 200) {
      List<GitHubFollowerModel> lst =
          gitHubFollowerModelFromJson(response.body);
      return lst;
    } else {
      throw SearchResultError.fromJson(result);
    }
  }
}
