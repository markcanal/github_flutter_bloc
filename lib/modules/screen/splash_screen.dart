import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc/modules/bloc/splash_screen/splash_screen_bloc.dart';
import 'package:github_flutter_bloc/modules/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animateControl;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    _dispatch(context);
    animateControl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animateControl);

    animation!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateControl.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animateControl.fling();
      }
    });
    animateControl.forward();
  }

  @override
  void dispose() {
    animateControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is SplashScreenLoaded) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()));
        }
      },
      child: SafeArea(
          child: AnimatedBuilder(
        animation: animateControl,
        builder: (BuildContext _, child) {
          return Transform.scale(
            scale: animateControl.value,
            child: child,
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 4,
              child: const Image(
                  image: NetworkImage(
                      'https://th.bing.com/th/id/R.c963626c145ea660ba7ceee666789c0a?rik=%2b8pQxk8WvGd0Fw&riu=http%3a%2f%2fpngimg.com%2fuploads%2fgithub%2fgithub_PNG28.png&ehk=SD294NKjXG3JppRn7fPyo6czUcyiLUWeIci5Y0RO%2fbk%3d&risl=&pid=ImgRaw&r=0')),
            ),
          ],
        ),
      )),
    );
  }

  void _dispatch(BuildContext context) {
    BlocProvider.of<SplashScreenBloc>(context).add(NavigateToHomeScreen());
  }
}
