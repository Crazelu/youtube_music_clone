import 'package:flutter/material.dart';
import 'package:youtube_music_clone/models/song.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_music_clone/utils/utils.dart';

class SongCardImage extends StatefulWidget {
  final Song song;
  const SongCardImage({Key? key, required this.song}) : super(key: key);

  @override
  _SongCardImageState createState() => _SongCardImageState();
}

class _SongCardImageState extends State<SongCardImage> {
  Song get song => widget.song;

  bool focused = false;
  ColorFilter? get colorFilter => focused
      ? ColorFilter.mode(
          Theme.of(context).backgroundColor.withOpacity(.7), BlendMode.darken)
      : song.playing
          ? ColorFilter.mode(Theme.of(context).backgroundColor.withOpacity(.7),
              BlendMode.darken)
          : null;

  void setFocus(bool val) {
    focused = val;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setFocus(true),
      onHover: (_) => setFocus(true),
      onExit: (_) => setFocus(false),
      child: Container(
          height: 80.h,
          width: 80.h,
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              colorFilter: colorFilter,
              fit: BoxFit.cover,
              image: AssetImage(song.image.png),
            ),
          ),
          child: song.playing
              ? Icon(
                  Icons.volume_up,
                  color: Theme.of(context).primaryColorLight,
                )
              : focused
                  ? Icon(
                      Icons.play_arrow,
                      color: Theme.of(context).primaryColorLight,
                    )
                  : null),
    );
  }
}