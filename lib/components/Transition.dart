import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

class Transition extends CustomPainter{
  
  double fromX;
  double fromY;
  double toX;
  double toY;
  List<String> chars = [];
  int fromID;
  int toID;
  bool focused = false;

  Transition(this.fromX, this.fromY,this.toX,this.toY,this.fromID,this.toID){

    _UpdateArrowDirection();
  }

  void _UpdateArrowDirection(){
    //right validations
    if(toX > fromX){
      fromX = fromX + 50;
      if(toY < fromY){
        toY = toY - fromY + 50;
        toX = toX - fromX;
      }
      else if(toY == fromY){
        fromY = fromY + 25;
      }
      else if(toY > fromY){
        fromY = fromY + 50;
        toY = toY - fromY;
        toX = toX - fromX;
      }
    }
    //left validations
    else if(toX < fromX){
      if(toY < fromY){
        toX = toX - fromX + 50;
        toY = toY - fromY + 50;
      }
      else if(toY == fromY){
        fromY = fromY + 25;
      }
      else if(toY > fromY){
        toX = toX - fromX + 50;
        toY = toY - fromY - 50;
        fromY = fromY + 50;
      }
    }
    //middle X validations
    else if(toX == fromX){
      fromX = fromX + 25;
      if(toY < fromY){
        fromY = 0;
      }
      else if(toY == fromY){
        fromY = fromY + 25;
      }
      else if(toY > fromY){
        fromY = fromY + 50;
      }
    }
  }

  Path arrowPath = new Path();

  Color getArrowColor(){
    return focused ? Colors.yellow.shade300: Colors.indigo.shade300 ;
  }

  void alterFocus(bool focus){
    focused = focus;
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 7.0;

    double x2 = 10; // onde em X a seta vai fazer a curva para chegar no destino
    double y2 = 10; // onde em Y a seta vai fazer a curva para chegar no destino

    arrowPath = Path();
    arrowPath.moveTo(fromX, fromY);
    arrowPath.relativeCubicTo(0, 0, x2, y2, toX, toY);
    arrowPath = ArrowPath.make(path: arrowPath);
    canvas.drawPath(arrowPath, paint..color = getArrowColor());
  }


  @override
  bool shouldRepaint(Transition oldDelegate) => true;

  @override
  bool hitTest(Offset points){

    return arrowPath.contains(points); 
  }
}