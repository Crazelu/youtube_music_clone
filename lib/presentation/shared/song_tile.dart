import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_music_clone/presentation/shared/song_tile_image.dart';

class SongTile extends StatelessWidget {
  final Function(Song) onTap;
  final Song song;
  const SongTile({
    Key? key,
    required this.song,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap(song);
      },
      selected: song.playing,
      selectedTileColor: const Color(0xff1d1d1d),
      leading: SongTileImage(song: song),
      title: Text(
        song.artist,
        style: TextStyle(
          fontSize: 38.sp,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Row(
          children: [
            if (song.ep) ...{
              Container(
                height: 30.h,
                width: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.h),
                  color: const Color(0xff808080),
                ),
                alignment: Alignment.center,
                child: Text(
                  'E',
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
              ),
              Gap(15.w),
            },
            Text(
              song.title,
              style: TextStyle(
                fontSize: 35.sp,
                color: const Color(0xff616161),
              ),
            ),
          ],
        ),
      ),
      trailing: Text(
        song.duration,
        style: TextStyle(
          fontSize: 30.sp,
          color: const Color(0xff616161),
        ),
      ),
    );
  }
}
