import 'package:flutter/material.dart';
import 'package:youtube_music_clone/handlers/navigation_handler.dart';
import 'package:youtube_music_clone/presentation/shared/nav_bar_items.dart';
import 'package:youtube_music_clone/utils/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;
  const NavBar({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    setState(() {});
  }

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
                NavBarItem(
                  title: 'Home',
                  current: _currentIndex == 0,
                  onTap: () {
                    setCurrentIndex(0);
                    locator<NavigationHandler>()
                        .pushReplacementNamed(HomeViewRoute);
                  },
                ),
                NavBarItem(
                  title: 'Explore',
                  current: _currentIndex == 1,
                  onTap: () {
                    setCurrentIndex(1);
                    locator<NavigationHandler>()
                        .pushReplacementNamed(ExploreViewRoute);
                  },
                ),
                NavBarItem(
                  title: 'Library',
                  current: _currentIndex == 2,
                  onTap: () {
                    setCurrentIndex(2);
                  },
                ),
                NavBarItem(
                  title: 'Search',
                  current: _currentIndex == 3,
                  search: true,
                  onTap: () {
                    setCurrentIndex(3);
                  },
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
