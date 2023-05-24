import 'package:flutter/material.dart';

class SubPage2 extends StatelessWidget {
  const SubPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 100,
      width: 100,
      color: Colors.amber,
      child: Text("Page2"),
    ));
  }
}
