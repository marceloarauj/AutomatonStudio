import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  const MenuButton({Key? key, this.fx, this.icon}) : super(key: key);

  final Function? fx;
  final IconData? icon;

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 130,
      child: OutlinedButton(
        onPressed:()=> {widget.fx!.call()},
        child: Icon(
          widget.icon,
          color: Colors.white,
          size: 90,
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white, width: 4)
        ),
      ),
    );
  }
}
