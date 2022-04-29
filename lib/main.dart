import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc/config/themes.dart';
import 'package:github_flutter_bloc/modules/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/user_profile/user_profile_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/user_repository/user_repository_bloc.dart';
import 'package:github_flutter_bloc/modules/screen/home_screen.dart';
import 'package:github_flutter_bloc/modules/screen/splash_screen.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserRepositoryBloc(
              githubRepositorySearch: githubRepositorySearch),
        ),
        BlocProvider(create: (context) => SplashScreenBloc()),
        BlocProvider(
            create: (context) => UserProfileBloc(githubRepositorySearch)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Github Bloc',
        theme: themeBlue,
        home: const SplashScreen(),
        // home: BlocBuilder<SplashScreenBloc, SplashScreenState>(
        //   builder: (context, state) {
        //     if (state is SplashScreenInitial || state is SplashScreenLoading) {
        //       return const SplashScreen();
        //     } else {
        //       return HomeScreen();
        //     }
        //   },
        // ),
      ),
    );
  }
}
