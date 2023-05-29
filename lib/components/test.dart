import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
// import 'package:never_behind_keyboard/src/never_behind_bottom.dart';
// import 'package:never_behind_keyboard/src/never_behind_source_focus_notification.dart';

class NeverBehindKeyboardArea extends StatefulWidget {
  final ScrollView scrollView;
  late NeverBehindBottom bottom;
  late BuildContext _context;
  late bool widgetInFocus = false;

  NeverBehindKeyboardArea({Key? key, required this.scrollView})
      : super(key: key);

  @override
  _NeverBehindKeyboardAreaState createState() =>
      _NeverBehindKeyboardAreaState();
}

class _NeverBehindKeyboardAreaState extends State<NeverBehindKeyboardArea> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (Notification notification) {
        if (notification is ScrollEndNotification) {
          //print('scroll end.');

          if (widget.widgetInFocus) {
            widget.widgetInFocus = false;
            _scrollToBottom();
          }
        } else if (notification is NeverHideSourceNotification) {
          //print('widget child in focus: ${notification.hasFocus}');
          widget.widgetInFocus = notification.hasFocus;
        }

        return true;
      },
      child: widget.scrollView,
    );
  }

  Future<void> _scrollToBottom() async {
    await Scrollable.ensureVisible(
      _getBottomContext(),
      alignment: 1,
      alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
    );
  }

  BuildContext _getBottomContext() {
    return (widget.bottom.key as GlobalKey).currentContext as BuildContext;
  }
}

// class _NeverBehindKeyboardAreaState extends State<NeverBehindKeyboardArea> {
//   // Widget _theScroller = Container();
//   GlobalKey key = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     // context.visitAncestorElements((element) {
//     //   var parentWidget = element.widget;

//     //   if (parentWidget is ListView ||
//     //       // parentWidget is SingleChildScrollView ||
//     //       parentWidget is ScrollView) {
//     //     _theScroller = parentWidget;
//     //     return false;
//     //   }

//     //   return true;
//     // });

//     return LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         return Container(
//           key: key,
//           child: widget.child,
//         );
//       },
//     );
//   }
// }

class NeverHideSourceNotification extends Notification {
  NeverHideSourceNotification(this.hasFocus);
  bool hasFocus = false;
}

// import 'package:flutter/material.dart';
// import 'package:never_behind_keyboard/src/never_behind_keyboard_area.dart';

class NeverBehindBottom extends StatelessWidget {
  const NeverBehindBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.visitAncestorElements((element) {
      var parentWidget = element.widget;

      if (parentWidget is NeverBehindKeyboardArea) {
        parentWidget.bottom = this;
        return false;
      }

      return true;
    });

    return Container();
  }
}
