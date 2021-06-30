import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/utils/utils.dart';
import 'song_card.dart';

class PlayListTab extends StatelessWidget {
  final List<Song> songs;
  final Function(Song) onSongSelected;
  const PlayListTab({
    Key? key,
    required this.songs,
    required this.onSongSelected,
  }) : super(key: key);

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
                              onTap: onSongSelected,
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
