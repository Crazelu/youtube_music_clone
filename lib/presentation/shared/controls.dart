import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SongControls extends StatelessWidget {
  final String duration;
  const SongControls({
    Key? key,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.skip_previous, size: 60.w),
          Gap(40.w),
          Icon(Icons.pause, size: 100.w),
          Gap(40.w),
          Icon(Icons.skip_next, size: 60.w),
          Gap(40.w),
          Text(
            "01:33 / $duration",
            style: TextStyle(
              fontSize: 32.sp,
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }
}
