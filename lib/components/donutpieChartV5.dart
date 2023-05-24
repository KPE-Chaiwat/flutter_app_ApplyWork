import 'dart:math';
import 'package:flutter/material.dart';

class DonutChartWidgetV5 extends StatefulWidget {
  final List<double>? values;
  final List<Color>? colors;
  final double? strokeWidth;

  DonutChartWidgetV5({this.values, this.colors, this.strokeWidth = 30.0});

  @override
  State<DonutChartWidgetV5> createState() => _DonutChartWidgetV5State();
}

class _DonutChartWidgetV5State extends State<DonutChartWidgetV5>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Color> _color = [
    const Color(0xff2fa2f4),
    const Color(0xfff7652b),
    const Color(0xfff8c239),
    const Color(0xfff839e8)
  ];

  @override
  Widget build(BuildContext context) {
    List<double> _values = widget.values ?? [];
    if (_values.length > 0) {
      return Container(
        width: 212,
        height: 212,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              painter: DonutChartPainter(
                  animationValue: _animationController.value,
                  values: _values,
                  colors: widget.colors ?? _color,
                  strokeWidth: widget.strokeWidth ?? 30),
              size: Size.square(200.0),
            );
          },
        ),
      );
    } else {
      return Container(
        width: 212,
        height: 212,
        child: Image.asset('assets/images/icon-bold-attention@3x.png'),
      );
    }
  }
}

class DonutChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double strokeWidth;
  final double animationValue;
  DonutChartPainter(
      {required this.values,
      required this.colors,
      this.strokeWidth = 30.0,
      required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    double total = values.reduce((a, b) => a + b);
    double startAngle = pi / 2;
    double endAngle = 0;
    double radius = min(size.width, size.height) / 2;

    for (int i = 0; i < values.length; i++) {
      Paint paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth;

      double arcAngle = (2 * pi * values[i] / total) * animationValue;
      endAngle = startAngle + arcAngle;

      Path path = Path()
        ..addArc(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2), radius: radius),
          startAngle,
          arcAngle,
        )
        ..arcTo(
          Rect.fromCircle(
              center: Offset(size.width / 2, size.height / 2),
              radius: radius - strokeWidth / 2),
          endAngle,
          -arcAngle,
          false,
        );

      canvas.drawPath(path, paint);

      double labelAngle = startAngle + (arcAngle / 2);
      double labelX = (size.width / 2) +
          ((radius - strokeWidth) / 2) * cos(labelAngle) * 1.3; //modifi1.3
      double labelY = (size.height / 2) +
          ((radius - strokeWidth) / 2) * sin(labelAngle) * 1.3; //modifi 1.3

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          // text: i == 3
          //     ? 'Other(${(values[i] / total * 100).toStringAsFixed(1)}%)'
          //     : '(${(values[i] / total * 100).toStringAsFixed(1)}%)',
          text: textPercent((values[i] / total * 100), i),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2),
        // Offset(
        //     labelX - textPainter.width + 10, labelY - textPainter.height + 10),
      );

      startAngle = endAngle;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

/*
DonutChartWidget(
  values: [0.25, 0.5, 0.25], // The values should add up to 1.
  colors: [Colors.red, Colors.green, Colors.blue],
  strokeWidth: 30.0, // Adjust the thickness of the donut chart.
),*/

// เอาไว้check ค่าน้อยกว่า 10%

String textPercent(double input, int index) {
  if (input < 10) {
    return '';
  } else if (index == 3) {
    return 'Other(${input.toStringAsFixed(1)}%)';
  } else {
    return '(${input.toStringAsFixed(1)}%)';
  }
}
