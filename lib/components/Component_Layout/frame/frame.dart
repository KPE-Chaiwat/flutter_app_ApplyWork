import 'package:flutter/material.dart';

import '../appbars/appbar.dart';
import '../buttomBar/buttombar.dart';

class WidgetFrame extends StatefulWidget {
  WidgetFrame({
    required this.body,
    required this.modeFrame,
    this.bgBody,
    this.height_widght,
    super.key,
  });
  Widget body;
  int modeFrame;
  Color? bgBody;
  Function(double maxheight, double maxwidth)? height_widght;

  @override
  State<WidgetFrame> createState() => _WidgetFrameState();
}

class _WidgetFrameState extends State<WidgetFrame> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext c, BoxConstraints constraints) {
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          color: widget.bgBody,
          // image: DecorationImage(
          //   fit: BoxFit.fill,
          //   image: AssetImage('assets/images/plants.png'),
          // ),
        ),
        child: Column(
          //mainAxisAlignment: mainAxisAlignment(mode: widget.modeFrame),
          children: [
            if (widget.modeFrame == 0) ...{
              AppBarCustom(),
              Expanded(
                child: Container(
                  // height: constraints.maxHeight - heightAppbar,
                  // width: constraints.maxWidth,
                  color: widget.bgBody,
                  child: widget.body,
                ),
              )
            },
            if (widget.modeFrame == 1) ...{
              Expanded(
                child: Container(
                  // height: constraints.maxHeight - heightAppbar,
                  // width: constraints.maxWidth,
                  color: widget.bgBody,
                  child: widget.body,
                ),
              ),
              ButtomBar()
            },
            if (widget.modeFrame == 2) ...{
              AppBarCustom(),
              Expanded(
                child: Container(
                  // height: constraints.maxHeight - heightAppbar,
                  // width: constraints.maxWidth,
                  color: widget.bgBody,
                  child: widget.body,
                ),
              ),
              ButtomBar()
            } else ...{
              Expanded(
                child: Container(
                  // height: constraints.maxHeight - heightAppbar,
                  // width: constraints.maxWidth,
                  color: widget.bgBody,
                  child: widget.body,
                ),
              ),
            }
          ],
        ),
      );
    });
  }

  // MainAxisAlignment mainAxisAlignment({required int mode}) {
  //   if (mode == 0 || mode == 1) {
  //     return MainAxisAlignment.start;
  //   } else {
  //     return MainAxisAlignment.spaceBetween;
  //   }
  // }
}
