import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomControlBarActions extends StatefulWidget {
  final bool hasLeftBottomControlBar;
  final bool showVolumeSlider;
  final VoidCallback toggleShowVolumeSlider;
  final VoidCallback shuffleSongs;
  const BottomControlBarActions({
    Key? key,
    this.hasLeftBottomControlBar = false,
    this.showVolumeSlider = false,
    required this.toggleShowVolumeSlider,
    required this.shuffleSongs,
  }) : super(key: key);

  @override
  _BottomControlBarActionsState createState() =>
      _BottomControlBarActionsState();
}

class _BottomControlBarActionsState extends State<BottomControlBarActions> {
  bool muted = false;
  RepeatType repeatType = RepeatType.none;
  double volume = .2;

  void toggleRepeat() {
    if (repeatType == RepeatType.none) {
      repeatType = RepeatType.all;
    } else if (repeatType == RepeatType.all) {
      repeatType = RepeatType.once;
    } else {
      repeatType = RepeatType.none;
    }
    setState(() {});
  }

  Icon getIcon(RepeatType type) {
    switch (type) {
      case RepeatType.all:
        return Icon(
          Icons.repeat,
          color: Theme.of(context).primaryColorLight,
          size: 55.w,
        );
      case RepeatType.once:
        return Icon(
          Icons.repeat_one,
          color: Theme.of(context).primaryColorLight,
          size: 55.w,
        );
      default:
        return Icon(
          Icons.repeat,
          color: Theme.of(context).accentColor,
          size: 55.w,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 720.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: widget.showVolumeSlider && !widget.hasLeftBottomControlBar,
            child: SizedBox(
              width: 280.w,
              child: Slider(
                activeColor: Theme.of(context).primaryColorLight,
                inactiveColor: Theme.of(context).accentColor,
                value: volume,
                onChanged: (val) {
                  setState(() {
                    volume = val;
                  });
                },
              ),
            ),
          ),
          MouseRegion(
            onEnter: (_) {
              widget.toggleShowVolumeSlider();
            },
            child: GestureDetector(
              onTap: () {
                setState(() {
                  muted = !muted;
                });
              },
              child: Icon(
                muted ? Icons.volume_off : Icons.volume_up,
                color: Theme.of(context).accentColor,
                size: 55.w,
              ),
            ),
          ),
          Gap(50.w),
          GestureDetector(
            onTap: toggleRepeat,
            child: getIcon(repeatType),
          ),
          Gap(50.w),
          GestureDetector(
            onTap: widget.shuffleSongs,
            child: Icon(
              Icons.shuffle,
              color: Theme.of(context).accentColor,
              size: 55.w,
            ),
          ),
          Gap(50.w),
          Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).primaryColorLight,
            size: 55.w,
          ),
          Gap(50.w),
        ],
      ),
    );
  }
}

enum RepeatType { once, all, none }
