import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:youtube_music_clone/models/song.dart';

class SongControls extends StatelessWidget {
  final Song song;
  final Function(Song) onNext;
  final Function(Song) onPrevious;
  final Function(Song) togglePlay;

  const SongControls({
    Key? key,
    required this.song,
    required this.onNext,
    required this.onPrevious,
    required this.togglePlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.skip_previous, size: 60.w),
            onPressed: () => onPrevious(song),
          ),
          Gap(20.w),
          GestureDetector(
            child: Icon(
              song.playing ? Icons.pause : Icons.play_arrow,
              size: 80.w,
            ),
            onTap: () => togglePlay(song),
          ),
          Gap(20.w),
          IconButton(
            icon: Icon(
              Icons.skip_next,
              size: 60.w,
            ),
            onPressed: () => onNext(song),
          ),
          Gap(40.w),
          Text(
            "01:33 / ${song.duration}",
            style: TextStyle(
              fontSize: 32.sp,
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }
}
