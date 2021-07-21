import 'dart:async';

import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  Alert({ Key? key, 
          required this.type, 
          required this.text, 
          required this.show, 
          required this.alertCallback, 
          required this.width, 
          required this.height}) : super(key: key);

  final AlertType type;
  final String text;
  final bool show;
  final double width;
  final double height;
  Function alertCallback;

  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert>{


  @override
  Widget build(BuildContext context) {

    if(!widget.show)
      return Container();

    widget.alertCallback();
  
    switch (widget.type) {
      case AlertType.Error: return Error(widget.width,widget.height);
      case AlertType.Info: return Info(widget.width,widget.height);
      case AlertType.Success: return Success(widget.width, widget.height);

      default:return Container();
    }
 
  }

  Container Error(double width, double height){
    return Container(
      color: Colors.red.shade300,
      width: width,
      height: height * 0.1,
      child: Row(
        children: [
            Container(
              width: width * 0.15,
              height: height,
              child: Center(child:Icon(Icons.error_outline,size: 40))
              ),
          Container(
            width: width * 0.85,
            height: height,
            alignment: Alignment.centerLeft,
            child: Text(widget.text,style: TextStyle(fontSize: 25, fontFamily: "Tittilium")), 
          )
        ],
      )
    );
  }
    Container Info(double width, double height){
    return Container(
      color: Colors.blue.shade300,
      width: width,
      height: height * 0.1,
      child: Row(
        children: [
          Container(
            width: width * 0.15,
            height: height,
            child: Center(child:Icon(Icons.info_outline,size: 40))
            ),
          Container(
            width: width * 0.85,
            height: height,
            alignment: Alignment.centerLeft,
            child: Text(widget.text, style: TextStyle(fontSize: 25, fontFamily: "Tittilium")), 
          )
        ],
      ),
    );
  }
    Container Success(double width, double height){
    return Container(
      color: Colors.green.shade300,
      width: width,
      height: height * 0.1,
      child: Row(
        children: [
          Container(
            width: width * 0.15,
            height: height,
            child: Center(child:Icon(Icons.check_circle_outlined,size: 40))
            ),
          Container(
            width: width * 0.85,
            height: height,
            alignment: Alignment.centerLeft,
            child: Text(widget.text, style: TextStyle(fontSize: 25, fontFamily: "Tittilium")), 
          )
        ],
      ),
    );
  }
}

enum AlertType{
  Error, Info, Success
}