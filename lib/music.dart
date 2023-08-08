import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:parla_home/home.dart';
import 'package:parla_home/res/AppColors.dart';
import 'package:parla_home/res/AppIcons.dart';
import 'package:permission_handler/permission_handler.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  final _audioQuery = OnAudioQuery();
  final _audioPlayer = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestPermission();
  }

  void requestPermission() {
    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorLight,
        leadingWidth: 100.0,
        leading: const Icon(AppIcons.music_logo),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.search)),
        ],
      ),
      body: FutureBuilder<List<SongModel>>(
        future: _audioQuery.querySongs(
            sortType: null,
            orderType: OrderType.ASC_OR_SMALLER,
            uriType: UriType.EXTERNAL,
            ignoreCase: true),
        builder: (context, song) {
          if (song.data == null) {
            const Center(
                child: CircularProgressIndicator(
              color: AppColors.secondaryColor,
              strokeWidth: 2.0,
            ));
          }
          if (song.data!.isEmpty) {
            return Center(
                child: FontedText('آهنگی پیدا نشد',
                    size: 16, color: AppColors.textColor));
          }
          return ListView.builder(
            itemCount: song.data?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const CircleAvatar(
                    radius: 25.0,
                    backgroundColor: AppColors.secondaryColor,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.0),
                      child: Icon(
                        AppIcons.music_fill,
                        color: AppColors.secondaryColorWhite,
                      ),
                    )),
                title: FontedText(
                    truncate(song.data![index].displayName, length: 30),
                    size: 16.0,
                    color: AppColors.textColor),
                subtitle: FontedText(song.data![index].artist.toString(),
                    size: 14.0, color: AppColors.secondaryColorLight),
                onTap: () {
                  _audioPlayer.pause();
                  _audioPlayer.setUrl(song.data![index].uri.toString());
                  _audioPlayer.play();
                },
              );
            },
          );
        },
      ),
    );
  }
}

String truncate(String text, {length: 7, omission: '...'}) {
  if (length >= text.length) {
    return text;
  }
  return text.replaceRange(length, text.length, omission);
}

// ListView.builder(
// itemCount: 10,
// itemBuilder: (context, index) {
// return Card(
// color: AppColors.primaryColorLight,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18.0),
// ),
// elevation: 2,
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: SizedBox(
// child: Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// ElevatedButton(
// onPressed: () {},
// style: ElevatedButton.styleFrom(
// shape: CircleBorder(),
// backgroundColor: AppColors.primaryColor,
// padding: EdgeInsets.all(12.0),
// ),
// child: const Center(
// child: Padding(
// padding: EdgeInsets.only(left: 3.0),
// child: Icon(AppIcons.music_fill),
// )),
// ),
// const SizedBox(
// width: 8.0,
// ),
// Column(
// mainAxisSize: MainAxisSize.min,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// FontedText("widget.device.name",
// size: 16.0, color: AppColors.textColor),
// FontedText("singer " + index.toString(),
// size: 14.0, color: AppColors.secondaryColorLight),
// ],
// )
// ],
// ),
// ),
// ),
// );
// },
// ),
