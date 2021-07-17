import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/presentation/shared/bottom_control_bar.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class SongPlayingView extends StatefulWidget {
  const SongPlayingView({Key? key}) : super(key: key);

  @override
  _SongPlayingViewState createState() => _SongPlayingViewState();
}

class _SongPlayingViewState extends State<SongPlayingView> {
  late List<Song> _songs;
  late Song _currentSong;

  Song get currentSong => _currentSong;
  List<Song> get songs => _songs;

  @override
  void initState() {
    super.initState();
    _songs = Song.songs;
    _currentSong = _songs[0];
  }

  void shuffleSongs() {
    songs.shuffle();
    setState(() {});
  }

  void onNext(Song song) {
    int nextIndex = 0;
    for (var i in songs) {
      if (i == song) {
        nextIndex = songs.indexOf(i) + 1;
        if (nextIndex == songs.length - 1) {
          nextIndex = 0;
        }
        i.playing = false;
      }
      currentSong.playing = false;
      songs[nextIndex].playing = true;
      _currentSong = songs[nextIndex];
      setState(() {});
    }
  }

  void onPrevious(Song song) {
    int prevIndex = 0;
    for (var i in songs) {
      if (i == song) {
        prevIndex = songs.indexOf(i) - 1;
        if (prevIndex < 0) {
          prevIndex = songs.length - 1;
        }
        i.playing = false;
      }
      currentSong.playing = false;
      songs[prevIndex].playing = true;
      _currentSong = songs[prevIndex];
      setState(() {});
    }
  }

  void togglePlay(Song song) {
    song.playing = !song.playing;
    setState(() {});
  }

  void toggleLike(Song song) {
    song.disliked = false;
    song.liked = !song.liked;
    setState(() {});
  }

  void toggleDislike(Song song) {
    song.liked = false;
    song.disliked = !song.disliked;
    setState(() {});
  }

  void onSongSelected(Song song) {
    bool playing = true;
    if (song.playing) playing = false;
    Song.songs.forEach((song) {
      song.playing = false;
    });

    song.playing = playing;
    _currentSong = song;
    setState(() {});
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
                    height: context.screenHeight(.6),
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
                      songs: _songs,
                      onSongSelected: onSongSelected,
                    ),
                  ),
                  Gap(50.w),
                ],
              ),
            ),
            BottomControlBar(
              currentSong: currentSong,
              songs: songs,
              shuffleSongs: shuffleSongs,
              onNext: onNext,
              onPrevious: onPrevious,
              togglePlay: togglePlay,
              toggleLike: toggleLike,
              toggleDislike: toggleDislike,
            ),
          ],
        ),
      );
    });
  }
}
