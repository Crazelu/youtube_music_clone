import 'package:flutter/material.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class SongPlayingView extends StatelessWidget {
  const SongPlayingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(builder: (context, size) {
      return Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            NavBar(),
            Gap(10.h),
          ],
        ),
      );
    });
  }
}
