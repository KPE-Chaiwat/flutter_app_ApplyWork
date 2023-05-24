import 'package:flutter/material.dart';

class AppBarSP1 extends StatelessWidget {
  const AppBarSP1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.pink,
      child: Row(
        children: [TextButton(onPressed: () {}, child: Text("BACK"))],
      ),
    );
  }
}
