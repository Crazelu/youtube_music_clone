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
            Gap(70.h),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Gap(context.screenWidth(.15)),
                  //song cover art
                  Container(
                    width: context.screenWidth(.35),
                    height: context.screenHeight(.5),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("album-cover".png))),
                  ),
                  Gap(50.w),
                  Expanded(
                      child: ListView(
                    children: [],
                  )),
                ],
              ),
            ),
            Gap(70.h),
            Container(
              height: 200.h,
              width: size.width,
            )
          ],
        ),
      );
    });
  }
}
