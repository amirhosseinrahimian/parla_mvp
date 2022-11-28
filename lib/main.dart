import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'res/AppColors.dart';

void main() {
  runApp(const Parla());
}

class Parla extends StatelessWidget {
  const Parla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashFactory: InkRipple.splashFactory,
        highlightColor: Colors.transparent,
        splashColor: AppColors.primaryColorDark.withOpacity(.1),
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    _animation = Tween(begin: 0.0, end: 0.3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
    _animationController.repeat(reverse: true);
    Timer(const Duration(milliseconds: 5000), () {
      _animationController.dispose();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const App()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.primaryColor));
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Center(
            child: Image.asset('assets/parla_splash.png', width: 150),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'A CLICK IS ENOUGH',
                      style: TextStyle(
                          color: AppColors.primaryColorDark,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 200.0,
                    height: 2.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: const [
                          AppColors.primaryColor,
                          AppColors.secondaryColor,
                          AppColors.secondaryColor,
                          AppColors.primaryColor
                        ],
                        stops: [
                          0.0,
                          0.2 + _animation.value,
                          0.8 - _animation.value,
                          1.0
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
