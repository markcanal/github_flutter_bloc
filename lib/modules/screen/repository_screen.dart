import 'package:flutter/material.dart';

class RepositoryScreen extends StatelessWidget {
  const RepositoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Card(
            child: ListTile(
              title: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.black,
                  child: Card(
                    child: ListTile(),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
