import 'package:flutter/material.dart';
import 'package:parla_home/res/AppColors.dart';
import 'package:parla_home/res/AppIcons.dart';

import 'home.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        leadingWidth: 100.0,
        leading: const Icon(AppIcons.music_logo),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.search)),
        ],
      ),
      body: Container(
        color: AppColors.primaryColor,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              color: AppColors.primaryColorLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.all(12.0),
                        ),
                        child: const Center(
                            child: Padding(
                          padding: EdgeInsets.only(left: 3.0),
                          child: Icon(AppIcons.music_fill),
                        )),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontedText("widget.device.name",
                              size: 16.0, color: AppColors.textColor),
                          FontedText("sads adasdsa das dsaasda",
                              size: 14.0, color: AppColors.secondaryColorLight),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
