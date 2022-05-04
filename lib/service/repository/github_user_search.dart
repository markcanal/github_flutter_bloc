// import 'package:flutter/material.dart';
import 'package:github_flutter_bloc/modules/model/github_profile_model.dart';
import 'package:github_flutter_bloc/modules/model/github_repositories_model.dart';
import 'package:github_flutter_bloc/modules/model/github_user_follower.dart';
import 'package:github_flutter_bloc/modules/model/github_user_following.dart';
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
    return result;
  }

  Future<List<GitHubFollowingModel>> getFollowingResults(
      {String? name, String? link}) async {
    final result =
        await gitHubApiService.userFollowing(userName: name, page: link);
    return result;
  }

  Future<List<GitHubFollowerModel>> getFollowerResults(
      {String? name, String? link}) async {
    final result =
        await gitHubApiService.userFollower(userName: name, page: link);
    return result;
  }
}
