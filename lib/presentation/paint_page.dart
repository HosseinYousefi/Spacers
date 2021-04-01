import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PaintPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final dataPoints = useState(<double>[0]);
    final stream =
        useStream(Stream.periodic(Duration(milliseconds: 100)), initialData: 0);
    useEffect(() {
      final l = dataPoints.value
        ..add(dataPoints.value.last + (Random().nextDouble() - 0.5) * 2);
      if (l.length > 40) {
        l.removeAt(0);
      }
    });
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          SizedBox(height: 50),
          Center(
            child: SizedBox(
              height: 300,
              width: 500,
              child: CustomPaint(
                foregroundPainter: MyPainter(dataPoints.value),
                painter: ChartBackgroundPainter(dataPoints.value.length),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final List<double> dataPoints;

  MyPainter(this.dataPoints);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // canvas.clipRect(rect);
    final w = rect.width;
    final h = rect.height;
    final lmin = dataPoints.reduce((value, element) => min(value, element));
    final lmax = dataPoints.reduce((value, element) => max(value, element));
    final llen = dataPoints.length;
    final offsets = <Offset>[];
    for (var i = 0; i < llen; ++i) {
      final v = dataPoints[i];
      final x = (w / llen) * i;
      final y = h - (v - lmin) * h / (lmax - lmin);
      print('{$x, $y}');
      offsets.add(Offset(x, y));
    }
    final path = Path()..moveTo(offsets[0].dx, offsets[0].dy);
    for (var i = 1; i < llen; ++i) {
      path.lineTo(offsets[i].dx, offsets[i].dy);
    }
    canvas.drawPath(
        path.shift(Offset(3, 3)),
        Paint()
          ..strokeWidth = 5
          ..color = Colors.black.withOpacity(0.3)
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round
          ..imageFilter = ImageFilter.blur(sigmaX: 5, sigmaY: 5));
    canvas.drawPath(
        path,
        Paint()
          ..strokeWidth = 5
          ..color = Colors.orange
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round);
    canvas.drawCircle(
        offsets.last, 40, Paint()..color = Colors.orange.withOpacity(0.1));
    canvas.drawCircle(
        offsets.last, 20, Paint()..color = Colors.orange.withOpacity(0.2));
    canvas.drawCircle(offsets.last, 10, Paint()..color = Colors.black);
    canvas.drawCircle(offsets.last, 5, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(MyPainter oldDelegate) {
    return true;
  }
}

class ChartBackgroundPainter extends CustomPainter {
  final int llen;

  ChartBackgroundPainter(this.llen);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    // canvas.clipRect(rect);
    final w = rect.width;
    final h = rect.height;
    for (var i = 1; i < llen; ++i) {
      final x = (w / llen) * i;
      canvas.drawLine(Offset(x, 0), Offset(x, h), Paint()..color = Colors.grey);
    }
  }

  @override
  bool shouldRepaint(ChartBackgroundPainter oldDelegate) {
    return true;
  }
}
