import 'package:flutter/material.dart';
import 'package:parla_home/home.dart';
import 'package:parla_home/music.dart';
import 'package:parla_home/settings.dart';
import 'package:parla_home/widgets/bottomNav.dart';

import './res/AppColors.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _navIndex = 0;
  int _perv_navIndex = 0;

  void _onNavTap(index) {
    setState(() {
      _perv_navIndex = _navIndex;
      _navIndex = index;
    });
  }

  final screens = [const Home(), const Music(), const Settings()];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        extendBody: true,
        body: IndexedStack(
          // for save state of per ...
          index: _navIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNav(_navIndex, _onNavTap),
      ),
    );
  }
}
