import 'package:flutter/material.dart';

import './res/AppColors.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Settings',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: 8.0,),
            Text(
              'so...on',
              style: TextStyle(
                color: AppColors.textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
