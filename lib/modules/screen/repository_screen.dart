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
    return BlocProvider(
      create: (context) =>
          UserRepositoryBloc(githubRepositorySearch: githubRepositorySearch),
      child: Scaffold(
        appBar: AppBar(title: Text('Repositories')),
        body: ScreenBody(searchController: searchController),
      ),
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
    final searchBloc = BlocProvider.of<UserRepositoryBloc>(context);
    return Column(
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: ListTile(
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: TextFormField(
                    onChanged: (value) {
                      searchBloc.add(OnPress(text: searchController.text));
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1)))),
              ),
              trailing: IconButton(
                  onPressed: () {
                    searchBloc.add(OnPress(text: searchController.text));
                  },
                  icon: Icon(Icons.search)),
            ),
          ),
        ),
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
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: const EdgeInsetsDirectional.all(5),
                                margin: const EdgeInsetsDirectional.all(2),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  elevation: 5,
                                  clipBehavior: Clip.antiAlias,
                                  semanticContainer: false,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Text(
                                            state.items[intx].name.toString(),
                                            style: const TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            state.items[intx].htmlUrl
                                                .toString(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 11),
                                          )),
                                      state.items[intx].description == null ||
                                              state.items[intx].description!
                                                  .isEmpty
                                          ? const Text('')
                                          : Container(
                                              margin: const EdgeInsets.all(10),
                                              child: Text(state
                                                  .items[intx].description
                                                  .toString()),
                                            ),
                                      state.items[intx].visibility == null ||
                                              state.items[intx].visibility
                                                  .isEmpty
                                          ? const Text('')
                                          : Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Chip(
                                                  label: Text(state
                                                      .items[intx].visibility
                                                      .toString())),
                                            ),
                                    ],
                                  ),
                                ),
                              ),
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
              return Icon(Icons.search);
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
