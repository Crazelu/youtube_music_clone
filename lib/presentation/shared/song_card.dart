import 'package:flutter/material.dart';
import 'package:youtube_music_clone/handlers/handlers.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationHandler>().pushNamed(SongPlayingViewRoute);
      },
      child: SizedBox(
        width: 380.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: 60.w),
              height: 400.h,
              width: 380.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.h),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(song.image.png),
                ),
              ),
            ),
            Gap(30.h),
            Container(
              width: 380.h,
              child: Text(
                song.title,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Gap(15.h),
            Row(
              children: [
                if (song.ep) ...{
                  Container(
                    height: 20.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.h),
                      color: const Color(0xff808080),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'E',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Theme.of(context).backgroundColor,
                      ),
                    ),
                  ),
                  Gap(15.w),
                },
                Container(
                  width: 300.h,
                  child: Text(
                    song.artist,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 30.sp,
                      color: const Color(0xff616161),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
