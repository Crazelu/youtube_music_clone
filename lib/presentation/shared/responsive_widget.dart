import 'package:flutter/material.dart';
import 'package:youtube_music_clone/utils/utils.dart';
import 'package:youtube_music_clone/handlers/handlers.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context, Size size) builder;
  final Color? backgroundColor;
  final AppBar? appBar;
  final Drawer? drawer;
  final bool resizeToAvoidBottomInset;
  final Function? onWillPop;
  final Widget? floatingActionButton;

  const ResponsiveWidget({
    Key? key,
    required this.builder,
    this.appBar,
    this.drawer,
    this.backgroundColor,
    this.onWillPop,
    this.floatingActionButton,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      Size constraints = Size(constraint.maxWidth, constraint.maxHeight);
      return WillPopScope(
        onWillPop: () {
          if (onWillPop != null) {
            onWillPop!();
          } else {
            locator<NavigationHandler>().goBack();
          }
          return Future.value(false);
        },
        child: Scaffold(
          floatingActionButton: floatingActionButton,
          backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: appBar,
          drawer: drawer,
          body: Builder(
            builder: (context) => builder(context, constraints),
          ),
        ),
      );
    });
  }
}
