import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key, this.fx, this.icon, this.label}) : super(key: key);

  final Function? fx;
  final IconData? icon;
  final String? label;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      width: 130,
      height: 130,
      child: Column(children: [
        OutlinedButton(
        onPressed:()=> {widget.fx!.call()},
        child: Icon(
          widget.icon,
          color: Colors.grey.shade900,
          size: 80,
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.black, width: 2)
        ),
      ),
      Text(widget.label ?? '',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,fontFamily: "Tittilium"))
      ])
    )
    );
  }
}
