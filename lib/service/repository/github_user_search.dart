// import 'package:flutter/material.dart';
import 'package:github_flutter_bloc/modules/model/github_profile_model.dart';
import 'package:github_flutter_bloc/modules/model/github_repositories_model.dart';
import 'package:github_flutter_bloc/modules/model/github_user_model.dart';
import 'package:github_flutter_bloc/service/provider/github_api_service.dart';

class GithubRepositorySearch {
  GithubRepositorySearch({required this.gitHubApiService});

  final GitHubApiService gitHubApiService;

  Future<List<GitHubRepositoriesModel>> getRepositoryOf(String str) async {
    final result = await gitHubApiService.findUserRepositories(str);
    return result;
  }

  Future<List<GitHubUserModel>> getUserList(
      {String? name, String? link}) async {
    final result = await gitHubApiService.listGithubUser();
    return result;
  }

  Future<GitHubProfileModel> getUserProfile(
      {String? name, String? link}) async {
    final result =
        await gitHubApiService.userProfile(userName: name, page: link);
    print('###Repository Search result for $name: $result');
    return result;
  }

  Future<GitHubProfileModel> getFollowResults(
      {String? name, String? link}) async {
    final result =
        await gitHubApiService.userProfile(userName: name, page: link);
    print('###Followers  result for $name: $result');
    return result;
  }
}
