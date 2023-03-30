import 'dart:async';

import 'package:flutter/material.dart';

class LiveRegionPage extends StatefulWidget {
  static const String route = 'live_region';
  const LiveRegionPage({Key? key}) : super(key: key);

  @override
  State<LiveRegionPage> createState() => _LiveRegionPageState();
}

class _LiveRegionPageState extends State<LiveRegionPage> {
  final String firstText = 'Subir archivos';
  int uploadedFiles = 0;
  final String secondAccessibilityText = 'Archivos subidos:';
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      setState(() {
        uploadedFiles = uploadedFiles + 1;
      });
    });
    super.initState();
  }

  @override
  void deactivate() {
    timer.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Region Viva'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    firstText,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Semantics(
                    label: '$secondAccessibilityText $uploadedFiles',
                    excludeSemantics: true,
                    liveRegion: true,
                    child: Text(uploadedFiles.toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
