import 'package:estudio_automato/components/MenuButton.dart';
import 'package:flutter/material.dart';

class GenericModal extends StatefulWidget {
  GenericModal(
      {Key? key,
      required this.title,
      required this.confirmEvent,
      required this.description,
      required this.visible,
      required this.closeEvent})
      : super(key: key);

  String title;
  String description;
  Function confirmEvent;
  Function closeEvent;
  bool visible;

  @override
  _GenericModalState createState() => _GenericModalState();
}

class _GenericModalState extends State<GenericModal> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.60;
    double height = MediaQuery.of(context).size.height * 0.65;

    return widget.visible
        ? Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(widget.title,
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
                            child: Text(widget.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    fontFamily: "Tittilium")))
                      ])),
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MenuButton(
                        icon: Icons.check,
                        fx: widget.confirmEvent.call(),
                      ),
                      MenuButton(
                          icon: Icons.close, fx: widget.closeEvent.call())
                    ],
                  ))
            ]))
        : Container();
  }
}
