import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';
import '../../../theme.dart';
 
class ArcModel {
  final Color color;
  final double value;
  ArcModel({required this.color, required this.value});
}

class CustomArcPainter180 extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double bgWidth;
  final double blurWidth;
  final double space;
  final List<ArcModel> arcs;
  CustomArcPainter180({
    this.start = 0,
    this.end = 180,
    this.width = 15,
    this.bgWidth = 10,
    this.blurWidth = 6,
    this.space = 4,
    required this.arcs,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2);

    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray70;
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgWidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startValue = 180 + start;
    var drawStart = startValue;
    canvas.drawArc(
        rect, radians(startValue), radians(180), false, backgroundPaint);

    for (var arc in arcs) {
      var endVal = drawStart + arc.value;
      Paint activePaint = Paint();
      activePaint.color = arc.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..color = arc.color.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5);

      Path path = Path();
      path.addArc(rect, radians(drawStart), radians(arc.value - space));
      canvas.drawPath(path, shadowPaint);

      canvas.drawArc(rect, radians(drawStart), radians(arc.value - space),
          false, activePaint);

      drawStart = drawStart + arc.value + space;
    }
  }

  @override
  bool shouldRepaint(CustomArcPainter180 oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(CustomArcPainter180 oldDelegate) => false;
}
