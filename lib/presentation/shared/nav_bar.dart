import 'package:flutter/material.dart';
import 'package:youtube_music_clone/presentation/shared/nav_bar_items.dart';
import 'package:youtube_music_clone/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
      height: 140.h,
      width: context.screenWidth(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("logo".png),
          Spacer(),
          Container(
            width: context.screenWidth(.35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavBarItem(title: 'Home'),
                NavBarItem(title: 'Explore'),
                NavBarItem(title: 'Library'),
                NavBarItem(
                  title: 'Search',
                  search: true,
                ),
              ],
            ),
          ),
          Spacer(),
          CircleAvatar(
            radius: 40.w,
            backgroundImage: AssetImage("avatar".jpg),
          )
        ],
      ),
    );
  }
}
