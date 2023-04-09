import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearContainer extends StatelessWidget {
  const LinearContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20),
      child: Container(
        width: 350,
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}