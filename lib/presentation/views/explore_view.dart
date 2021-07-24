import 'package:flutter/material.dart';
import 'package:youtube_music_clone/presentation/shared/shared.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      builder: (_, size) {
        return SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              NavBar(currentIndex: 1),
            ],
          ),
        );
      },
    );
  }
}
