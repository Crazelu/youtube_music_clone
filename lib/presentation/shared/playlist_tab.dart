import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

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
                  Container(),
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
