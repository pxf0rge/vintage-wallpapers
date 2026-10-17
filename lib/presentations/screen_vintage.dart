import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';
import 'package:vintage_wallpapers/presentations/screen_viewer.dart';

class ScreenVintage extends StatelessWidget {
  const ScreenVintage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> wallpapers = List.generate(
      40,
      (i) => "assets/wallpapers/wallpaper${i + 1}.webp",
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CoderBar(
        titleWidget: Text(
          "WallyImage",
          style: context.headline4.copyWith(
            color: AppTheme.colors.text,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AppTheme.colors.primary.withAlpha(100),
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(top: context.paddingTop + kToolbarHeight),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 9 / 16,
        ),
        itemCount: wallpapers.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushScreen(ScreenViewer(imagePath: wallpapers[index]));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(wallpapers[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
