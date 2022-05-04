import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/user_repository/user_repository_bloc.dart';
import 'package:github_flutter_bloc/modules/screen/repository_screen.dart';
import 'package:github_flutter_bloc/modules/screen/user_screen.dart';
import 'package:github_flutter_bloc/service/provider/github_api_service.dart';
import 'package:github_flutter_bloc/service/repository/github_user_search.dart';

import '../bloc/user_profile/user_profile_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  TabController? tabControl;
  final githubRepositorySearch =
      GithubRepositorySearch(gitHubApiService: GitHubApiService());

  List tabList = [
    const Tab(child: Text("Repositories")),
    const Tab(child: Text("User")),
  ];

  List tabView = [
    RepositoryScreen(
        githubRepositorySearch:
            GithubRepositorySearch(gitHubApiService: GitHubApiService())),
    const UserScreen(),
  ];

  int selectedIndex = 0;

  @override
  void initState() {
    context.read<UserProfileBloc>().add(const OnLoad());
    tabControl = TabController(length: tabList.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabControl!.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final searchBloc = BlocProvider.of<UserRepositoryBloc>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Flutter GitHub'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(5),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: ListTile(
                title: TextFormField(
                    onChanged: (value) {},
                    controller: searchController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)))),
                trailing: IconButton(
                    onPressed: () {
                      // searchBloc.add(OnPress(text: searchController.text));
                      if (selectedIndex == 1) {
                        if (searchController.text == '') {
                          context.read<UserProfileBloc>().add(const OnLoad());
                        } else {
                          context
                              .read<UserProfileBloc>()
                              .add(OnSearch(name: searchController.text));
                          context
                              .read<UserRepositoryBloc>()
                              .add(OnPress(text: searchController.text));
                        }
                      } else {
                        context
                            .read<UserRepositoryBloc>()
                            .add(OnPress(text: searchController.text));
                      }
                    },
                    icon: const Icon(Icons.search)),
              ),
            ),
          ),
          TabBar(
            controller: tabControl,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            onTap: (value) {
              setState(() {
                selectedIndex = value;
                searchController.text = '';
              });
              if (selectedIndex == 0) {
                context
                    .read<UserRepositoryBloc>()
                    .add(OnPress(text: searchController.text));
              } else if (selectedIndex == 1) {
                context
                    .read<UserProfileBloc>()
                    .add(OnSearch(name: searchController.text));
              }
            },
            tabs: [
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Repositories',
                    )
                  ],
                ),
              ),
              Tab(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Users'),
                  ],
                ),
              ),
              //   // Tab(
              //   //   child: Column(
              //   //     mainAxisAlignment: MainAxisAlignment.center,
              //   //     children: const [
              //   //       Text('Profile'),
              //   //     ],
              //   //   ),
              //   // )
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabControl,
              children: [
                RepositoryScreen(
                    githubRepositorySearch: githubRepositorySearch),
                const UserScreen(),
                // Container(
                //   color: Colors.pink,
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
