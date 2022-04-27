// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/user_repository/user_repository_bloc.dart';
import 'package:github_flutter_bloc/service/repository/github_user_search.dart';
import 'package:github_flutter_bloc/ui/load_page_effect.dart';

class RepositoryScreen extends StatelessWidget {
  RepositoryScreen({Key? key, required this.githubRepositorySearch})
      : super(key: key);

  final searchController = TextEditingController();
  final GithubRepositorySearch githubRepositorySearch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Repositories')),
      body: ScreenBody(searchController: searchController),
    );
  }
}

class ScreenBody extends StatelessWidget {
  const ScreenBody({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    // final searchBloc = BlocProvider.of<UserRepositoryBloc>(context);
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<UserRepositoryBloc, UserRepositoryState>(
            builder: (context, state) {
              if (state is UserRepositoryIsOnload) {
                return LoadPageEffect()
                    .shimmerMe(LoadPageEffect().repositorySkeleton());
              }

              if (state is UserRepositoryIsComplete) {
                return state.items.isEmpty
                    ? NoResults()
                    : ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, intx) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Card(
                                elevation: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          color:
                                              Colors.blueGrey.withOpacity(0.3),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 10),
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    state.items[intx].owner
                                                        .avatarUrl),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Text(
                                                state.items[intx].name,
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(state.items[intx].fullName,
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.left),
                                              TextButton(
                                                style: ButtonStyle(
                                                    alignment:
                                                        Alignment.centerLeft),
                                                onPressed: () {},
                                                child: Text(
                                                  state.items[intx].htmlUrl,
                                                  style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.blue),
                                                  textAlign: TextAlign.left,
                                                ),
                                              ),
                                              state.items[intx].description ==
                                                      null
                                                  ? Container()
                                                  : Column(
                                                      children: [
                                                        Divider(
                                                          thickness: 1,
                                                        ),
                                                        Text(
                                                            '** Project Description **',
                                                            style: TextStyle(
                                                                fontSize: 11),
                                                            textAlign:
                                                                TextAlign.left),
                                                        Divider(
                                                          thickness: 1,
                                                        ),
                                                        Text(
                                                            state.items[intx]
                                                                .description,
                                                            style: TextStyle(
                                                                fontSize: 11),
                                                            textAlign: TextAlign
                                                                .justify),
                                                      ],
                                                    )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          );
                        });
              }

              if (state is UserRepositoryIsError) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      size: 40,
                    ),
                    Text(
                      state.error,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                      child: Icon(
                    Icons.search,
                    size: 30,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Search User'),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class NoResults extends StatelessWidget {
  const NoResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Icon(
          Icons.error,
          size: 50,
        ),
        Text(
          'No Result',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
