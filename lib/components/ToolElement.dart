import 'package:flutter/material.dart';

class ToolElement extends StatefulWidget {
  ToolElement({Key? key, this.fx, required this.imageIcon,required this.selected}) : super(key: key);

  final Image imageIcon;
  final Function? fx;
  bool selected;

  @override
  _ToolElementState createState() => _ToolElementState();
}

class _ToolElementState extends State<ToolElement> {
  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.10;
    return enabledButton(iconSize);
  }

  Widget enabledButton(double iconSize){
    return widget.selected? Container(
      width: iconSize,
      height: iconSize,
                decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.white,
                Colors.purple.shade200,
                Colors.lightBlueAccent.shade700
              ])),
      child: OutlinedButton(
          child: widget.imageIcon,
          onPressed: () => {widget.fx!.call()})
    ):
    Container(
      width: iconSize,
      height: iconSize,
                decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Colors.grey.shade300,
                Colors.grey.shade900,
              ])),
      child: widget.imageIcon
    );
  }
}
