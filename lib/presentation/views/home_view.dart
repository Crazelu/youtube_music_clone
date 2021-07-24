import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (_, size) {
        return SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              NavBar(),
              Gap(100.h),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 125.w),
                  children: [
                    SectionTitle("Your favorites", hideSeeAll: true),
                    Gap(70.h),
                    SongsCarousel(songs: Song.songs),
                    Gap(100.h),
                    Text(
                      "LISTEN AGAIN",
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 35.sp,
                      ),
                    ),
                    Gap(10.h),
                    SectionTitle("Your evening music", hideSeeAll: true),
                    Gap(70.h),
                    SongsCarousel(songs: Song.songs),
                    Gap(100.h),
                    SectionTitle("New releases"),
                    Gap(70.h),
                    SongsCarousel(songs: Song.songs),
                    Gap(100.h),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
