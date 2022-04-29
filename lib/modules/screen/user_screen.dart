import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/user_profile/user_profile_bloc.dart';
import 'package:github_flutter_bloc/widgets/ui/load_page_effect.dart';
import 'package:url_launcher/url_launcher.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              if (state is UserProfileInitial ||
                  state is UserProfileInOnSearch) {
                return LoadPageEffect()
                    .shimmerMe(LoadPageEffect().userFollowSkeleton());
              }
              if (state is UserProfileInLoadAll) {
                return state.items.isEmpty
                    ? const NoResults()
                    : ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, intx) {
                          return Column(
                            children: [
                              Card(
                                elevation: 5,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          child: CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                state.items[intx].avatarUrl),
                                            radius: 40,
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5),
                                              child: Text(
                                                state.items[intx].login,
                                                style: const TextStyle(
                                                    color: Colors.blue,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                              ),
                                            ),
                                            TextButton(
                                              child: Text(
                                                  state.items[intx].htmlUrl),
                                              onPressed: () {
                                                Uri _url = Uri.parse(
                                                    state.items[intx].htmlUrl);
                                                _launchUrl(_url);
                                              },
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      );
              }
              if (state is UserProfileLoadAllError) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    Icons.list_sharp,
                    size: 30,
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('No Record'),
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

void _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
