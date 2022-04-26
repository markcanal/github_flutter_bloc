import 'package:github_flutter_bloc/modules/model/github_profile_model.dart';
import 'package:github_flutter_bloc/modules/model/github_repositories_model.dart';
import 'package:github_flutter_bloc/service/provider/github_api_service.dart';

class GithubRepositorySearch {
  GithubRepositorySearch({required this.gitHubApiService});

  final GitHubApiService gitHubApiService;

  Future<List<GitHubRepositoriesModel>> getRepositoryOf(String str) async {
    final result = gitHubApiService.findUserRepositories(str);
    return result;
  }

  Future<List<GitHubProfileModel>> getUserList(
      {String? name, String? link}) async {
    final result = gitHubApiService.listGithubUser(uName: name, dataLink: link);
    return result;
  }
}
