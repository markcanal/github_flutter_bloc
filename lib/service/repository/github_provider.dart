import 'package:github_flutter_bloc/service/provider/github_api_service.dart';

class GithubProvider {
  GithubProvider({required this.gitHubApiService});

  final GitHubApiService gitHubApiService;
}
