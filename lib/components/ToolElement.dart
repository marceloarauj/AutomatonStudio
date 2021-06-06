import 'package:flutter/material.dart';

class ToolElement extends StatefulWidget {
  const ToolElement({Key? key, this.icon, this.fx}) : super(key: key);

  final IconData? icon;
  final Function? fx;

  @override
  _ToolElementState createState() => _ToolElementState();
}

class _ToolElementState extends State<ToolElement> {
  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.10;

    return Container(
      width: iconSize,
      height: iconSize,
      child: OutlinedButton(
          child: Icon(widget.icon, color: Colors.black87),
          onPressed: () => {widget.fx!.call()}),
    );
  }
}
