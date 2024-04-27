import 'package:flutter/material.dart';

class HorizontalLineWithCircle extends StatelessWidget {
  final double lineWidth;
  final double circleRadius;
  final double startCircleVerticalRadiusScale;
  final Color lineColor;
  final Color circleColor;

  const HorizontalLineWithCircle({
    this.lineWidth = 10.0,
    this.circleRadius = 4,
    this.startCircleVerticalRadiusScale =
        1, // Scale down the vertical radius of the start circle
    this.lineColor = const Color.fromARGB(255, 138, 144, 168),
    this.circleColor = const Color.fromARGB(255, 0, 0, 0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        left: 15,
        right: 15,
      ),
      width: double.infinity,
      height: circleRadius * 1, // Adjust the height of the container as needed
      child: CustomPaint(
        painter: HorizontalLinePainter(
          lineWidth: lineWidth,
          circleRadius: circleRadius,
          startCircleVerticalRadiusScale: startCircleVerticalRadiusScale,
          lineColor: lineColor,
          circleColor: circleColor,
        ),
      ),
    );
  }
}

class HorizontalLinePainter extends CustomPainter {
  final double lineWidth;
  final double circleRadius;
  final double startCircleVerticalRadiusScale;
  final Color lineColor;
  final Color circleColor;

  HorizontalLinePainter({
    this.lineWidth = 2.0,
    this.circleRadius = 2.0,
    this.startCircleVerticalRadiusScale = 2.0,
    this.lineColor = const Color.fromARGB(255, 185, 33, 33),
    this.circleColor = Colors.black,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor
      ..strokeWidth = lineWidth;

    final double circleCenterY = size.height / 2;
    const double dottedLineSpacing =
        6; // Adjust the spacing of dotted line as needed

    // Draw deflated circle at the left
    canvas.drawCircle(
      Offset(circleRadius * 0, circleCenterY),
      circleRadius * startCircleVerticalRadiusScale, // Adjusted radius
      Paint()..color = circleColor,
    );

    // Draw circle at the right
    canvas.drawCircle(Offset(size.width - circleRadius * 1, circleCenterY),
        circleRadius, Paint()..color = circleColor);

    // Draw dotted line
    for (double x = circleRadius * 1 +
            circleRadius * startCircleVerticalRadiusScale +
            dottedLineSpacing * 0;
        x < size.width - circleRadius * 2 - circleRadius;
        x += dottedLineSpacing * 2) {
      canvas.drawLine(
        Offset(x, circleCenterY),
        Offset(x + dottedLineSpacing, circleCenterY),
        paint
          ..color =
              lineColor.withOpacity(0.5), // Adjust opacity for dotted line
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
