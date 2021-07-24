import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class SongsCarousel extends StatefulWidget {
  final List<Song> songs;

  const SongsCarousel({
    Key? key,
    required this.songs,
  }) : super(key: key);

  @override
  _SongsCarouselState createState() => _SongsCarouselState();
}

class _SongsCarouselState extends State<SongsCarousel> {
  final songCardWidth = 380.h + 60.w;
  final controller = ScrollController();
  var scrolledCards = 0;

  void scrollToNextSlide() {
    scrolledCards += (context.screenWidth() / songCardWidth).ceil();
    var offset = (scrolledCards - .5) * (songCardWidth) + 100.w;

    final maxOffset = (widget.songs.length) * (songCardWidth);

    print(offset);
    print(maxOffset);

    if (offset > maxOffset) {
      setState(() {
        scrolledCards = 0;
      });
      controller.animateTo(
        maxOffset - offset,
        duration: Duration(milliseconds: 450),
        curve: Curves.easeIn,
      );
    } else {
      controller.animateTo(
        offset,
        duration: Duration(milliseconds: 450),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 600.h,
        maxWidth: context.screenWidth(),
      ),
      width: context.screenWidth(),
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.songs.length,
            itemBuilder: (_, index) {
              return SongCard(song: widget.songs[index]);
            },
          ),
          Positioned(
            bottom: 350.h,
            right: -20,
            child: GestureDetector(
              onTap: scrollToNextSlide,
              child: Container(
                alignment: Alignment.center,
                height: 80.h,
                width: 80.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).primaryColorDark,
                  size: 60.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
