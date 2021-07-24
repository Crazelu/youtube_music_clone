import 'package:flutter/material.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';
import 'dart:math' show Random;

class GenreCard extends StatelessWidget {
  final String title;
  const GenreCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.w),
      clipBehavior: Clip.antiAlias,
      child: Container(
        margin: EdgeInsets.only(right: 20.w),
        alignment: Alignment.centerLeft,
        height: 100.h,
        width: context.screenWidth(1 / 7),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border(
            left: BorderSide(
              width: 20.w,
              color: getColor(),
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Text(
            title,
            style: TextStyle(fontSize: 32.sp),
          ),
        ),
      ),
    );
  }
}

Color getColor() {
  final random = Random();
  final codes = 'abcdef0123456789';

  var hex = '0xff';
  while (hex.length < 10) {
    hex += codes[random.nextInt(codes.length) | 0];
  }

  return Color(int.tryParse(hex) ?? 0xff);
}
