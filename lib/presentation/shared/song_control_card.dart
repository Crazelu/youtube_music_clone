import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_music_clone/utils/utils.dart';

class SongControlCard extends StatelessWidget {
  final Song song;
  const SongControlCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth(.7),
      child: Row(
        children: [
          Container(
            height: 80.h,
            width: 80.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(song.image.png),
              ),
            ),
          ),
          Gap(40.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: context.screenWidth(.3),
                child: Text(
                  song.title,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(10.h),
              Row(
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
                  Container(
                    width: context.screenWidth(.38),
                    child: Text(
                      "${song.artist} • ${song.title} • ${song.year}",
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: const Color(0xff616161),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
