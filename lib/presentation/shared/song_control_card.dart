import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_music_clone/utils/utils.dart';

class SongControlCard extends StatelessWidget {
  final Function(Song) onLiked;
  final Function(Song) onDisliked;
  final Song song;

  const SongControlCard({
    Key? key,
    required this.onLiked,
    required this.onDisliked,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.screenWidth(.5)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70.h,
            width: 70.h,
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
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: context.screenWidth(.3)),
                child: Text(
                  song.title,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 35.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Gap(5.h),
              Row(
                children: [
                  if (song.ep) ...{
                    Container(
                      height: 25.h,
                      width: 25.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.h),
                        color: const Color(0xff808080),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'E',
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                    ),
                    Gap(15.w),
                  },
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: context.screenWidth(.38),
                    ),
                    child: Text(
                      "${song.artist} • ${song.title} • ${song.year}",
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: const Color(0xff616161),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(40.w),
          GestureDetector(
            onTap: () => onDisliked(song),
            child: Icon(
              song.disliked ? Icons.thumb_down : Icons.thumb_down_outlined,
              color: song.disliked
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).accentColor,
              size: 50.w,
            ),
          ),
          Gap(50.w),
          GestureDetector(
            onTap: () => onLiked(song),
            child: Icon(
              song.liked ? Icons.thumb_up : Icons.thumb_up_outlined,
              color: song.liked
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).accentColor,
              size: 50.w,
            ),
          ),
          Gap(50.w),
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.more_vert,
              color: Theme.of(context).accentColor,
              size: 50.w,
            ),
          ),
        ],
      ),
    );
  }
}
