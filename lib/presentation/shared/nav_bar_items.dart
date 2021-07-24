import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarItem extends StatefulWidget {
  final String title;
  final bool current;
  final Function? onTap;
  final bool search;
  const NavBarItem({
    Key? key,
    required this.title,
    this.current = false,
    this.search = false,
    this.onTap,
  }) : super(key: key);

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  bool _focused = false;

  void setFocus(bool val) {
    _focused = val;
    setState(() {});
  }

  Color get color => widget.current
      ? Theme.of(context).primaryColorLight
      : _focused
          ? Theme.of(context).primaryColorLight
          : Theme.of(context).highlightColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setFocus(true),
      onHover: (_) => setFocus(true),
      onExit: (_) => setFocus(false),
      child: TextButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith(
            (states) => Theme.of(context).backgroundColor,
          ),
        ),
        onPressed: () {
          if (widget.onTap != null) {
            widget.onTap!();
          }
        },
        icon: widget.search
            ? Icon(
                Icons.search,
                color: color,
              )
            : Container(),
        label: Text(
          widget.title,
          style: TextStyle(
            fontSize: 40.sp,
            color: color,
          ),
        ),
      ),
    );
  }
}
