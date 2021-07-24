import 'package:flutter/material.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class SectionTitle extends StatelessWidget {
  final String text;
  final bool hideSeeAll;
  const SectionTitle(
    this.text, {
    Key? key,
    this.hideSeeAll = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 50.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Gap(70.w),
        if (!hideSeeAll)
          Text(
            "SEE ALL",
            style: TextStyle(
              fontSize: 30.sp,
              color: Theme.of(context).highlightColor,
            ),
          ),
      ],
    );
  }
}
