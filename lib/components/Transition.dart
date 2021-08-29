import 'package:arrow_path/arrow_path.dart';
import 'package:flutter/material.dart';

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

  void _UpdateArrowDirection(){
    //right validations
    if(isSelfTransaction()){
      fromY = fromY + 0;
      fromX = fromX + 25;
      toX = fromX;
      toY = fromY;
    }
    else if(toX > fromX){
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
    squarePath.addPolygon(_getPolygon(), true);
  }

  Color getArrowColor(){
    return transition.focused ? Colors.yellow.shade300: Colors.indigo.shade300 ;
  }

  List<Offset> _getPolygon(){
    List<Offset> points = [];
    points.add(Offset(transition.fromX - 10,transition.fromY - 10));
    points.add(Offset(transition.fromX + 10,transition.fromY + 10));
    points.add(Offset(transition.toX + transition.fromX + 10, transition.toY+ transition.fromY + 10));
    points.add(Offset(transition.toX + transition.fromX - 10, transition.toY+ transition.fromY - 10));

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
      arrowPath.relativeCubicTo(0, 0, x2, y2, transition.toX, transition.toY);
    }

    arrowPath = ArrowPath.make(path: arrowPath);
    canvas.drawPath(arrowPath, paint..color = getArrowColor());
  
    //canvas.drawPath(squarePath, paint..color = Colors.red);
  }

  @override
  bool shouldRepaint(TransitionView oldDelegate) => true;

  @override
  bool hitTest(Offset points){
    
    return squarePath.contains(points); 
  }

}