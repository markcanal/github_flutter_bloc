import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final String location;
  final String blogSite;
  final String reposiroty;
  final String followers;
  final String following;

  const UserProfile({
    Key? key,
    required this.avatarUrl,
    required this.userName,
    required this.location,
    required this.blogSite,
    required this.followers,
    required this.following,
    required this.reposiroty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
                child: Card(
                  color: Colors.blueGrey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(avatarUrl),
                          radius: 40,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text.rich(
                                TextSpan(
                                  text: 'Name: ',
                                  style: const TextStyle(
                                      color:
                                          Color.fromARGB(255, 172, 208, 237)),
                                  children: [
                                    TextSpan(
                                        text: userName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic))
                                  ],
                                ),
                              ),
                            ),
                            location.isEmpty
                                ? Container()
                                : Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text.rich(
                                      TextSpan(
                                        text: 'Location: ',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 172, 208, 237)),
                                        children: [
                                          TextSpan(
                                              text: location,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic))
                                        ],
                                      ),
                                    ),
                                  ),
                            blogSite.isEmpty
                                ? Container()
                                : Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text.rich(
                                      TextSpan(
                                        text: 'Blog: ',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 172, 208, 237)),
                                        children: [
                                          TextSpan(
                                              text: blogSite,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  fontSize: 11))
                                        ],
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
            child: Card(
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 1),
                child: Material(
                  elevation: 5,
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(50),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.amber,
                    indicatorWeight: 3,
                    labelColor: const Color.fromARGB(255, 172, 208, 237),
                    unselectedLabelColor:
                        const Color.fromARGB(255, 172, 208, 237),
                    tabs: [
                      Tab(
                        // text: 'Repositories',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(reposiroty),
                            const Text('Repositories'),
                          ],
                        ),
                      ),
                      Tab(
                        // text: 'Followers',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(followers),
                            const Text('Followers'),
                          ],
                        ),
                      ),
                      Tab(
                        // text: 'Following',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(following),
                            const Text('Following'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: TabBarView(
              physics: const ClampingScrollPhysics(),
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.blue,
                ),
                Container(
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
