import 'package:flutter/material.dart';

import './res/AppColors.dart';

class Music extends StatelessWidget {
  const Music({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.purple,
      child: Center(
        child: Text(
          'Music',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: AppColors.textColor,
          ),
        ),
      ),
    );
  }
}
