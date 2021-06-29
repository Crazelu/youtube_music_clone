import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_music_clone/handlers/handlers.dart';
import 'package:youtube_music_clone/presentation/views/views.dart';
import 'package:youtube_music_clone/utils/utils.dart';

void main() async {
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(2880, 1527),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'YT Music Clone',
        theme: ThemeData(
          fontFamily: "Roboto",
          backgroundColor: const Color(0xff030303),
          highlightColor: const Color(0xff818181),
          primaryColorLight: const Color(0xffffffff),
          accentColor: const Color(0xffa9a9a9),
          errorColor: const Color(0xffff0100),
          primarySwatch: Colors.blue,
        ),
        navigatorKey: locator<NavigationHandler>().navigatorKey,
        home: SongPlayingView(),
      ),
    );
  }
}
