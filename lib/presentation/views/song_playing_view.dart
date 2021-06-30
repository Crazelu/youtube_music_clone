import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class SongPlayingView extends StatefulWidget {
  const SongPlayingView({Key? key}) : super(key: key);

  @override
  _SongPlayingViewState createState() => _SongPlayingViewState();
}

class _SongPlayingViewState extends State<SongPlayingView> {
  late List<Song> songs;
  late Song currentSong;
  @override
  void initState() {
    super.initState();
    songs = Song.songs;
    currentSong = songs[0];
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            NavBar(),
            Gap(70.h),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Gap(context.screenWidth(.1)),
                  //song cover art
                  Container(
                    width: context.screenWidth(.37),
                    height: context.screenHeight(.65),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(currentSong.image.png),
                      ),
                    ),
                  ),
                  Gap(250.w),
                  Expanded(
                    child: PlayListTab(
                      songs: songs,
                      onSongSelected: (song) {
                        bool playing = true;
                        if (song.playing) playing = false;
                        Song.songs.forEach((song) {
                          song.playing = false;
                        });

                        song.playing = playing;
                        currentSong = song;
                        setState(() {});
                      },
                    ),
                  ),
                  Gap(50.w),
                ],
              ),
            ),
            Gap(70.h),
            Container(
              height: 200.h,
              width: size.width,
            )
          ],
        ),
      );
    });
  }
}
