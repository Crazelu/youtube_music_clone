import 'package:flutter/material.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class ExploreCard extends StatefulWidget {
  final String title;
  final IconData icon;

  const ExploreCard({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  _ExploreCardState createState() => _ExploreCardState();
}

class _ExploreCardState extends State<ExploreCard> {
  final disabledColor = Color(0xff292929);
  var hoveredColor;

  var containerColor;

  @override
  void initState() {
    super.initState();
    hoveredColor = disabledColor.withOpacity(.7);
    containerColor = disabledColor;
  }

  void onHover() {
    containerColor = hoveredColor;
    setState(() {});
  }

  void onExitMouseRegion() {
    containerColor = disabledColor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => onHover(),
      onExit: (_) => onExitMouseRegion(),
      child: Container(
        alignment: Alignment.centerLeft,
        height: 120.h,
        width: context.screenWidth(1 / 3.4),
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(10.h),
        ),
        child: Row(
          children: [
            Gap(80.w),
            Icon(widget.icon),
            Gap(40.w),
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 48.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
