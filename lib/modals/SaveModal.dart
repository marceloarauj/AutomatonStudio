import 'package:estudio_automato/components/MenuButton.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';

class SaveModal extends StatefulWidget {
  SaveModal(
      {Key? key,
      required this.screenWidth,
      required this.screenHeight,
      required this.visible,
      required this.filename,
      required this.close,
      required this.save})
      : super(key: key);

  final double screenWidth;
  final double screenHeight;
  bool visible;
  String filename;
  Function close;
  Function save;

  @override
  _SaveModalState createState() => _SaveModalState();
}

class _SaveModalState extends State<SaveModal> {
  TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = widget.screenWidth * 0.60;
    double height = widget.screenHeight * 0.65;

    return widget.visible
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(Language.saveProject,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "Tittilium"))
                ]),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: width * 0.7,
                              child: TextField(
                                decoration: new InputDecoration(
                                    hintText: Language.filename),
                                controller: valueController,
                                style: TextStyle(fontFamily: "Tittilium"),
                              ))
                        ])),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MenuButton(
                          icon: Icons.save,
                          label: Language.save,
                          fx: widget.save,
                        ),
                        MenuButton(
                          icon: Icons.close,
                          label: Language.close,
                          fx: widget.close,
                        )
                      ],
                    ))
              ],
            ),
          )
        : Container();
  }
}
