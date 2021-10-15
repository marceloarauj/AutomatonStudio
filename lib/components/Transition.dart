import 'dart:math';

import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as Math;

class Transition{
  
  double fromX;
  double fromY;
  double toX;
  double toY;
  List<String> chars = [];
  int fromID;
  int toID;
  bool focused = false;
  TextEditingController transitionsText = TextEditingController();
  
  Transition(this.fromX, this.fromY,this.toX,this.toY,this.fromID,this.toID){
    
    _UpdateArrowDirection();
  }

  double getThetaAngle(Offset from, Offset to){
     double difX = to.dx - from.dx;
     double difY = to.dy - from.dy;

     double rotation = -atan2(difX, difY); // angle theta -pi..pi
     double degreesRotation = Math.degrees(rotation) + 180;

     return Math.radians(degreesRotation);
  }

  Offset getOffsetCircle(double centerX, double centerY, double radians){
    double radius = 25;

    radians = radians - Math.radians(90.0);

    int x = ((cos(radians) * radius) + centerX).round();
    int y = ((sin(radians) * radius) + centerY).round();

    return Offset(x.toDouble(),y.toDouble());
  }

  void _UpdateArrowDirection(){

    if(isSelfTransaction()){
      fromY = fromY + 0;
      fromX = fromX + 25;
      toX = fromX;
      toY = fromY;
      return;
    }
    
    double centerFromX = fromX + 25;
    double centerFromY = fromY + 25;
    double centerToX = toX + 25;
    double centerToY = toY + 25;

    Offset from = Offset(fromX, fromY);
    Offset to = Offset(toX, toY);

    double fromRadiansAngle = getThetaAngle(from, to);
    double toRadiansAngle = getThetaAngle(to, from);

    Offset fromPoints = getOffsetCircle(centerFromX, centerFromY, fromRadiansAngle);
    Offset toPoints = getOffsetCircle(centerToX, centerToY, toRadiansAngle);

    fromX = fromPoints.dx;
    fromY = fromPoints.dy;

    toX = toPoints.dx;
    toY = toPoints.dy;

  }

  void alterFocus(bool focus){
    focused = focus;
  }

  bool isSelfTransaction(){
    return fromID == toID;
  }

}

class TransitionView extends CustomPainter{
  
  final Transition transition;
  Path squarePath = new Path();

  TransitionView({required this.transition}){

    squarePath = Path();
    squarePath.moveTo(transition.fromX, transition.fromY);
    squarePath.addPolygon(transition.isSelfTransaction()? _getSelfTransitionPolygon() : _getPolygon(), true);
  }

  Color getArrowColor(){
    return transition.focused ? Colors.yellow.shade300: Colors.indigo.shade300 ;
  }

  List<Offset> _getPolygon(){
    List<Offset> points = [];
    points.add(Offset(transition.fromX - 10,transition.fromY - 10));
    points.add(Offset(transition.fromX + 10,transition.fromY + 10));
    points.add(Offset(transition.toX, transition.toY + 10));
    points.add(Offset(transition.toX, transition.toY - 10));

    return points;
  }

  List<Offset> _getSelfTransitionPolygon(){
    List<Offset> points = [];
    points.add(Offset(transition.fromX - 35,transition.fromY));
    points.add(Offset(transition.fromX - 35,transition.fromY - 65));
    points.add(Offset(transition.fromX + 40,transition.fromY - 65));
    points.add(Offset(transition.fromX + 40,transition.fromY));

    return points;
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 3.0;

    double x2 = 1; // onde em X a seta vai fazer a curva para chegar no destino
    double y2 = 1; // onde em Y a seta vai fazer a curva para chegar no destino
    var arrowPath = Path();
    arrowPath.moveTo(transition.fromX, transition.fromY);

    if(transition.isSelfTransaction()){
      arrowPath.relativeCubicTo(-120, -80, 120, -80, 10, -2);
    }else{
      arrowPath.lineTo(transition.toX, transition.toY);
    }

    arrowPath = ArrowPath.make(path: arrowPath);
    canvas.drawPath(arrowPath, paint..color = getArrowColor());
  
    //canvas.drawPath(squarePath, paint..color = Colors.red); debug
  }

  @override
  bool shouldRepaint(TransitionView oldDelegate) => true;

  @override
  bool hitTest(Offset points){
    
    return squarePath.contains(points); 
  }

}