import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:parla_home/home.dart';

class LampSettings extends StatelessWidget {
  const LampSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Image.network(
            'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png'),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Center(
            child: FontedText('text', size: 12),
          ),
        ),
      ],
    );
  }
}
