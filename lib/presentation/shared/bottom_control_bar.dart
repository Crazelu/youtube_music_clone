import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'shared.dart';

class BottomControlBar extends StatefulWidget {
  final Song currentSong;
  final List<Song> songs;
  final Function(Song) onNext;
  final Function(Song) onPrevious;
  final Function(Song) togglePlay;
  final Function(Song) toggleLike;
  final Function(Song) toggleDislike;
  final VoidCallback shuffleSongs;

  const BottomControlBar({
    Key? key,
    required this.currentSong,
    required this.songs,
    required this.onNext,
    required this.onPrevious,
    required this.togglePlay,
    required this.toggleLike,
    required this.toggleDislike,
    required this.shuffleSongs,
  }) : super(key: key);

  @override
  _BottomControlBarState createState() => _BottomControlBarState();
}

class _BottomControlBarState extends State<BottomControlBar> {
  bool leftArea = false;
  bool showVolumeSlider = false;

  void toggleShowVolumeSlider() {
    setState(() {
      showVolumeSlider = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          leftArea = false;
        });
      },
      onExit: (_) {
        setState(() {
          leftArea = true;
          showVolumeSlider = false;
        });
      },
      child: Container(
        color: const Color(0xff212121),
        height: 200.h,
        width: context.screenWidth(),
        child: Column(
          children: [
            Container(
              height: 5.h,
              width: context.screenWidth(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).errorColor,
                    Theme.of(context).errorColor,
                  ],
                ),
              ),
            ),
            Gap(40.h),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Gap(60.w),
                SongControls(
                  song: widget.currentSong,
                  onNext: widget.onNext,
                  onPrevious: widget.onPrevious,
                  togglePlay: widget.togglePlay,
                ),
                Spacer(),
                SongControlCard(
                  song: widget.currentSong,
                  onLiked: widget.toggleLike,
                  onDisliked: widget.toggleDislike,
                ),
                Spacer(),
                BottomControlBarActions(
                  hasLeftBottomControlBar: leftArea,
                  showVolumeSlider: showVolumeSlider,
                  toggleShowVolumeSlider: toggleShowVolumeSlider,
                  shuffleSongs: widget.shuffleSongs,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
