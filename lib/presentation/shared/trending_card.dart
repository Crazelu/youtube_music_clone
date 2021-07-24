import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class TrendingSongCard extends StatelessWidget {
  final Song song;
  const TrendingSongCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      constraints: BoxConstraints(
        maxHeight: 120.h,
        maxWidth: context.screenWidth(1 / 3.4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80.h,
            width: 180.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  song.image.png,
                ),
              ),
            ),
          ),
          Text("${song.index}"),
          Container(
            width: context.screenWidth(1 / 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(song.title),
                Gap(10.h),
                Text(
                  song.artist,
                  style: TextStyle(
                    color: Theme.of(context).highlightColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
