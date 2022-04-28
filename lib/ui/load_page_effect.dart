import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadPageEffect {
  Widget shimmerMe(Widget view) {
    return Column(
      children: [
        Expanded(child: Center(child: view)),
      ],
    );
  }

  Widget userListSkeleton() {
    return Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.blue,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                child: const CircleAvatar(
                                  radius: 40,
                                ),
                              ),
                              const Text(
                                "",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w700),
                              ),
                              const Text(
                                "",
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              Text("",
                                  style: TextStyle(fontSize: 12),
                                  textAlign: TextAlign.center),
                              Text("",
                                  style: TextStyle(fontSize: 11),
                                  textAlign: TextAlign.center),
                              Column(
                                children: [
                                  Divider(),
                                  Text('** Project Description **',
                                      style: TextStyle(fontSize: 11),
                                      textAlign: TextAlign.center),
                                  Divider(),
                                  Text("",
                                      style: TextStyle(fontSize: 11),
                                      textAlign: TextAlign.justify),
                                ],
                              )
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
          itemCount: 10,
        ));
  }

  Widget userFollowSkeleton() {
    return Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.blue,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 14.0),
                  child: const CircleAvatar(
                      backgroundColor: Colors.white, radius: 50),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          const EdgeInsetsDirectional.only(top: 10, bottom: 8),
                      height: 20,
                      width: 120,
                      color: Colors.white,
                    ),
                    Container(
                      height: 15,
                      width: double.infinity,
                      color: Colors.white,
                    )
                  ],
                ))
              ],
            ),
          ),
          itemCount: 7,
        ));
  }

  Widget repositorySkeleton() {
    return Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.grey,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsetsDirectional.all(3),
                margin: const EdgeInsetsDirectional.all(2),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  semanticContainer: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Text("",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ),
                      Container(
                          color: Colors.white,
                          width: 42,
                          margin: const EdgeInsets.only(left: 5),
                          child: Text(
                            "".toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 11),
                          )),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Text(""),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        child: const Chip(label: Text("")),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              margin: const EdgeInsets.all(5),
                              child: const Icon(Icons.account_tree_sharp)),
                          const Divider(
                            height: 1,
                          ),
                          Container(
                            margin: const EdgeInsets.all(5),
                            child: const Text(
                              "",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          itemCount: 6,
        ));
  }
}
