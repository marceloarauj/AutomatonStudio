import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class Transition extends CustomPainter{
  
  double? from;
  double? to;
  List<String>? transitions;

  Transition({required double from, required double to}){
    this.from = from;
    this.to = to;
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 3.0;

    double x0 = 100; // inicio da seta em X
    double y0 = 100; // inicio da seta em Y

    double x1 = 0; // não sei como funciona essa curva ainda
    double y1 = 0; // não sei como funciona essa curva ainda

    double x2 = 0; // onde em X a seta vai fazer a curva para chegar no destino
    double y2 = 0; // onde em Y a seta vai fazer a curva para chegar no destino

    double x3 = 500; // destino em X
    double y3 = 200; // destino em Y

    Path arrowPath = Path();
    arrowPath.moveTo(x0, y0);
    arrowPath.relativeCubicTo(x0, y0, x2, y2, x3, y3);
    arrowPath = ArrowPath.make(path: arrowPath);
    canvas.drawPath(arrowPath, paint..color = Colors.purple.shade300);
  }


  @override
  bool shouldRepaint(Transition oldDelegate) => true;

}