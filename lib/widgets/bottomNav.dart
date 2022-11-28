import 'package:flutter/material.dart';

import '../res/AppColors.dart';
import '../res/AppIcons.dart';

class BottomNav extends StatelessWidget {
  int navIndex;
  var onNavTap;
  BottomNav(this.navIndex, this.onNavTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10.0, left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
                color: AppColors.shadowColor,
                spreadRadius: 1.0,
                blurRadius: 10.0),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: BottomNavigationBar(
            unselectedItemColor: AppColors.secondaryColorWhite,
            selectedItemColor: AppColors.secondaryColor,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.primaryColorLight,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: "settings",
                icon: Icon(AppIcons.settings_outlined),
                activeIcon: Icon(AppIcons.settings),
                tooltip: "",
              ),
              BottomNavigationBarItem(
                label: "music",
                icon: Icon(AppIcons.music_outlined),
                activeIcon: Icon(AppIcons.music),
                tooltip: "",
              ),
              BottomNavigationBarItem(
                label: "home",
                icon: Icon(AppIcons.home_outlined),
                activeIcon: Icon(AppIcons.home),
                tooltip: "",
              ),
            ],
            currentIndex: navIndex,
            onTap: (index) {
              onNavTap(index);
            },
          ),
        ));
  }
}
