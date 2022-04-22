import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc/config/themes.dart';
import 'package:github_flutter_bloc/modules/bloc/user_repository/user_repository_bloc.dart';
import 'package:github_flutter_bloc/modules/screen/home_screen.dart';
import 'package:github_flutter_bloc/modules/screen/repository_screen.dart';
import 'package:github_flutter_bloc/modules/screen/user_screen.dart';
import 'package:github_flutter_bloc/service/provider/github_api_service.dart';

void main() {
  runApp(MyApp(
    title: const Text('Home'),
    themeData: themeBlue,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.title, this.themeData}) : super(key: key);
  GitHubApiService gitHubApiService = GitHubApiService();
  final Widget? title;
  final ThemeData? themeData;

  static const List<Widget> _pages = <Widget>[
    RepositoryScreen(),
    HomeScreen(),
    UserScreen(),
  ];
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserRepositoryBloc>(
          create: (context) => UserRepositoryBloc(),
        ),
      ],
      child: MaterialApp(
        theme: themeData,
        title: 'Flutter Github Bloc',
        home: BodyMain(
            title: title, pages: _pages, selectedindex: _selectedindex),
      ),
    );
  }
}

class BodyMain extends StatefulWidget {
  BodyMain({
    Key? key,
    required this.title,
    required List<Widget> pages,
    int? selectedindex,
  })  : _pages = pages,
        _selectedindex = selectedindex!,
        super(key: key);

  final Widget? title;
  final List<Widget> _pages;
  int _selectedindex;

  @override
  State<BodyMain> createState() => _BodyMainState();
}

class _BodyMainState extends State<BodyMain> {
  void _updateIndex(int value) {
    setState(() {
      widget._selectedindex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        currentIndex: widget._selectedindex,
        onTap: _updateIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(color: Colors.white, size: 35),
        selectedItemColor: Colors.amberAccent,
        unselectedIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        unselectedItemColor: Colors.black,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: ''),
        ],
      ),
      appBar: AppBar(
        elevation: 6,
        title: widget.title,
      ),
      body: IndexedStack(children: [
        widget._pages.elementAt(widget._selectedindex),
      ]),
    );
  }
}
