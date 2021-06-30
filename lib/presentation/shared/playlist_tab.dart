import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:youtube_music_clone/models/song.dart';

import 'song_card.dart';

class PlayListTab extends StatelessWidget {
  const PlayListTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(60.h),
            TabBar(
              unselectedLabelColor: Theme.of(context).highlightColor,
              tabs: [
                Tab(text: 'UP NEXT'),
                Tab(text: 'LYRICS'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                      child: ListView.builder(
                          itemCount: Song.songs.length,
                          itemBuilder: (_, index) {
                            var song = Song.songs[index];
                            return SongCard(
                              song: song,
                              onTap: (song) {
                                bool playing = true;
                                if (song.playing) playing = false;
                                Song.songs.forEach((song) {
                                  song.playing = false;
                                });

                                song.playing = playing;
                              },
                            );
                          })),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
