import 'package:flutter/material.dart';

import 'features/announcement_screen/ui/announcement_screen.dart';

void main() {
  runApp(NatvKg());
}

class NatvKg extends StatelessWidget {
  const NatvKg({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnouncementScreen(),
    );
  }
}
