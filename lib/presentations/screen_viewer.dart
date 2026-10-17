import 'dart:io';

import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ScreenViewer extends StatelessWidget {
  final String imagePath;

  const ScreenViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: CoderBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        isBack: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.share, color: Colors.white),
              onPressed: () async {
                final byteData = await rootBundle.load(imagePath);
                final buffer = byteData.buffer;
                final tempDir = await getTemporaryDirectory();
                final tempPath = "${tempDir.path}/${imagePath.split("/").last}";

                final file = await File(tempPath).writeAsBytes(buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

                await SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));
              },
            ),
          ),
        ],
      ),
      body: Image.asset(imagePath, fit: BoxFit.cover, width: double.infinity, height: double.infinity),
    );
  }
}
