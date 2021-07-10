import 'dart:async';

import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  Alert({ Key? key, required this.type, required this.text, required this.show, required this.alertCallback}) : super(key: key);

  final AlertType type;
  final String text;
  final bool show;
  Function alertCallback;

  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if(!widget.show)
      return Container();

    widget.alertCallback();
  
    switch (widget.type) {
      case AlertType.Error: return Error(width,height);
      case AlertType.Info: return Info(width,height);
      case AlertType.Success: return Success(width, height);

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