import 'package:flutter/material.dart';

class TestComponent extends StatelessWidget {
  const TestComponent({super.key, this.height, this.width, this.color});
  final double? height, width;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
