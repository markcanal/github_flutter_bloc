import 'package:flutter/material.dart';
import 'package:github_flutter_bloc/core/provider/github_api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  GitHubApiService gitHubApiService = GitHubApiService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView(children: [
        Text(gitHubApiService.listGithubUser().toString()),
      ]),
    );
  }
}
