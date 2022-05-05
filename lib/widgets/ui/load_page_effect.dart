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

  Widget profileSkeleton() {
    return Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.blue,
        enabled: true,
        child: ListView.builder(
          itemBuilder: (_, __) => Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.blueGrey,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const CircleAvatar(
                        // backgroundImage: NetworkImage(avatarUrl),
                        radius: 40,
                      ),
                    ),
                    Container(
                      height: 50,
                    )
                  ],
                ),
              )
            ],
          ),
          itemCount: 10,
        ));
  }

  Widget userSkeleton() {
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
                      backgroundColor: Colors.white, radius: 30),
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
        highlightColor: Colors.blue,
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
                            height: 5,
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
