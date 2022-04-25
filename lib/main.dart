import 'package:flutter/material.dart';
import 'package:github_flutter_bloc/config/themes.dart';
import 'package:github_flutter_bloc/modules/screen/home_screen.dart';
import 'package:github_flutter_bloc/modules/screen/repository_screen.dart';
import 'package:github_flutter_bloc/modules/screen/splash_screen.dart';
import 'package:github_flutter_bloc/modules/screen/user_screen.dart';
import 'package:github_flutter_bloc/service/provider/github_api_service.dart';
import 'package:github_flutter_bloc/service/repository/github_user_search.dart';

void main() {
  final GithubRepositorySearch githubRepositorySearch =
      GithubRepositorySearch(gitHubApiService: GitHubApiService());
  runApp(MyApp(
    githubRepositorySearch: githubRepositorySearch,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.githubRepositorySearch})
      : super(key: key);
  final GithubRepositorySearch githubRepositorySearch;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Github Bloc',
      theme: themeBlue,
      home: const SplashScreen(),
      // routes: {
      //   '/': (context) => const HomeScreen(),
      //   '/repository': (context) =>
      //       RepositoryScreen(githubRepositorySearch: githubRepositorySearch),
      //   '/user': (context) => const UserScreen()
      // },
    );
  }
}
