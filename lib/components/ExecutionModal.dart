import 'package:flutter/material.dart';

class ExecutionModal extends StatefulWidget {
  const ExecutionModal({ Key? key
                        ,this.executeFunction
                        ,required this.screenWidth
                        ,required this.screenHeight }) : super(key: key);

  final Function(String)? executeFunction;
  final double screenWidth;
  final double screenHeight;
  
  @override
  _ExecutionModalState createState() => _ExecutionModalState();
}

class _ExecutionModalState extends State<ExecutionModal> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth * 0.60,
      height: widget.screenHeight * 0.30,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                child: Icon(Icons.check_circle)
              ),
              Container(
                child: Text("Sucess"),
              ),
              Container(
                child: IconButton(
                  onPressed: ()=>{},
                  icon: Icon(Icons.close_outlined)
                  )
              )
            ]
          ), 
          Row(
            children: [
              Container(
                width: 50,
                child: TextField(
    
                )
              ),
              Container(
                child: IconButton(
                  onPressed: ()=>{}
                  ,icon: Icon(Icons.arrow_right)
                ),
              )
            ],
          ) 
        ]
      ),
      );
  }
}