import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (_, size) {
        return SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              NavBar(currentIndex: 1),
              Gap(80.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ExploreCard(
                    icon: Icons.audiotrack_outlined,
                    title: "New Releases",
                  ),
                  ExploreCard(
                    icon: Icons.auto_graph,
                    title: "Charts",
                  ),
                  ExploreCard(
                    icon: Icons.emoji_emotions_outlined,
                    title: "Moods & Genres",
                  ),
                ],
              ),
              Gap(150.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 125.w),
                child: Column(
                  children: [
                    SectionTitle("New albums and singles"),
                    Gap(100.h),
                    SongsCarousel(songs: Song.songs),
                    Gap(100.h),
                    SectionTitle("Moods & genres"),
                    Gap(100.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenreCard(title: "African"),
                        GenreCard(title: "Workout"),
                        GenreCard(title: "Chill"),
                        GenreCard(title: "2010s"),
                        GenreCard(title: "House"),
                        GenreCard(title: "2000s"),
                      ],
                    ),
                    Gap(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenreCard(title: "Indie & Alternative"),
                        GenreCard(title: "R&B & Soul"),
                        GenreCard(title: "Party"),
                        GenreCard(title: "Sleep"),
                        GenreCard(title: "Jazz"),
                        GenreCard(title: "Focus"),
                      ],
                    ),
                    Gap(30.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GenreCard(title: "Hip-Hop"),
                        GenreCard(title: "Romance"),
                        GenreCard(title: "Commute"),
                        GenreCard(title: "Energy Boosters"),
                        GenreCard(title: "Dance & Electronic"),
                        GenreCard(title: "Soundtracks & Musicals"),
                      ],
                    ),
                    Gap(100.h),
                    SectionTitle("Trending"),
                    Gap(100.h),
                    Wrap(
                      runAlignment: WrapAlignment.start,
                      spacing: 10.w,
                      runSpacing: 40.h,
                      children: Song.songs
                          .map((song) => TrendingSongCard(song: song))
                          .toList(),
                    ),
                    Gap(100.h),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
