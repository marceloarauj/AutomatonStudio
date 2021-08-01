import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';

class ExecutionModal extends StatefulWidget {
  const ExecutionModal({ Key? key
                        ,required this.executeFunction
                        ,required this.screenWidth
                        ,required this.screenHeight }) : super(key: key);

  final Function(String) executeFunction;
  final double screenWidth;
  final double screenHeight;
  
  @override
  _ExecutionModalState createState() => _ExecutionModalState();
}

class _ExecutionModalState extends State<ExecutionModal> {

  TextEditingController valueController = TextEditingController();
  Icon icon = Icon(Icons.gesture);
  String status = Language.waiting;

  @override
  Widget build(BuildContext context) {

    double width = widget.screenWidth * 0.60;
    double height = widget.screenHeight * 0.30;

    return Container(
      width: width,
      height:height,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: width * 0.2,
                child: icon
              ),
              Container(
                width: width * 0.6,
                child: Text(status
                            ,style: TextStyle(fontFamily: "Tittilium")),
              ),
              Container(
                width: width * 0.2,
                child: IconButton(
                  color: Colors.red.shade500,
                  onPressed: ()=>{},
                  icon: Icon(Icons.close_outlined)
                  )
              )
            ]
          ), 
          Row(
            children: [
              Container(
                width: width * 0.1,
              ),
              Container(
                width: width * 0.7,
                child: TextField(
                  controller: valueController,
                  style: TextStyle(fontFamily: "Tittilium"),
                )
              ),
              Container(
                width: width * 0.2,
                child: IconButton(
                  color: Colors.green,
                  onPressed: ()=>{ _executeMethod(valueController.text)}
                  ,icon: Icon(Icons.play_circle)
                ),
              )
            ],
          ) 
        ]
      ),
      );
  }

  void _executeMethod(String value){

    bool accept = widget.executeFunction.call(value);

    if(accept)
    {
      icon = Icon(Icons.check_circle,color: Colors.green.shade600);
      status = Language.success;
    }
    else
    {
      icon = Icon(Icons.warning, color: Colors.red.shade600);
      status = Language.rejected;
    }

    setState(() {});
  }


}