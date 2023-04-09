import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  const ChannelCard({
    super.key,
    required this.id,
    required this.channelName,
    required this.logo,
    required this.pricePerLetter,
  });

  final dynamic id;
  final dynamic channelName;
  final dynamic logo;
  final dynamic pricePerLetter;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 70,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.network(
              logo,
              height: 80,
              width: 80,
            ),
          ],
        ));
  }
}
