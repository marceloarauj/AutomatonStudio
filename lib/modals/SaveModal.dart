import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';

class SaveModal extends StatefulWidget {
  SaveModal(
      {Key? key,
      required this.screenWidth,
      required this.screenHeight,
      required this.visible,
      required this.filename})
      : super(key: key);

  final double screenWidth;
  final double screenHeight;
  bool visible;
  String filename;

  @override
  _SaveModalState createState() => _SaveModalState();
}

class _SaveModalState extends State<SaveModal> {
  @override
  Widget build(BuildContext context) {
    double width = widget.screenWidth * 0.60;
    double height = widget.screenHeight * 0.45;

    return widget.visible
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Text(Language.saveProject,
                       textAlign: TextAlign.center,
                       style: TextStyle(fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        fontFamily: "Tittilium"))
                ]),
                Row(),
                Row()
              ],
            ),
          )
        : Container();
  }
}
