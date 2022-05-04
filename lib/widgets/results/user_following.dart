import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/user_following/user_following_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/user_profile/user_profile_bloc.dart';
import 'package:github_flutter_bloc/modules/screen/user_screen.dart';

class UserFollowingView extends StatelessWidget {
  const UserFollowingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FollowingResult(),
    );
  }
}

class FollowingResult extends StatelessWidget {
  const FollowingResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFollowingBloc, UserFollowingState>(
      builder: (context, state) {
        if (state is UserFollowingInit) {}

        if (state is UserFollowingLoaded) {
          return state.items.isEmpty
              ? const NoResults()
              : ListView.builder(
                  itemCount: state.items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 48),
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(top: 25),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      state.items[index].login.toString(),
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 172, 208, 237),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    state.items[index].htmlUrl.toString(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 172, 208, 237),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              child: CircleAvatar(
                                radius: 40.0,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                    child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: GestureDetector(
                                        onTap: () => context
                                            .read<UserProfileBloc>()
                                            .add(OnSearch(
                                                name: state.items[index].login
                                                    .toString())),
                                        child: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 12.0,
                                          child: Icon(
                                            Icons.search,
                                            size: 15.0,
                                            color: Color(0xFF404040),
                                          ),
                                        ),
                                      ),
                                    ),
                                    radius: 38.0,
                                    backgroundImage: NetworkImage(state
                                        .items[index].avatarUrl
                                        .toString())),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
        }
        if (state is UserFollowingError) {
          return Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 40,
                color: Colors.redAccent,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  state.error,
                  textAlign: TextAlign.justify,
                ),
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
            Text('Search'),
          ],
        );
      },
    );
  }
}
