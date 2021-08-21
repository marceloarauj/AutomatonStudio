import 'package:estudio_automato/components/Transition.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';
import 'package:masked_text/masked_text.dart';

class TransitionOptions extends StatefulWidget {
  TransitionOptions(
      {Key? key, this.transition, required this.delete, required this.update, required this.save})
      : super(key: key);

  Transition? transition;
  Function() update;
  Function() delete;
  Function(String) save;

  @override
  _TransitionOptionsState createState() => _TransitionOptionsState();
}

class _TransitionOptionsState extends State<TransitionOptions> {
  @override
  Widget build(BuildContext context) {
    return widget.transition == null
        ? Container()
        : Transform(
            transform: Matrix4.translationValues(
                widget.transition!.fromX + 60, widget.transition!.fromY, 0),
            child: Container(
                width: 150,
                height: 145,
                color: Colors.grey.shade100,
                child: Column(children: [
                  Row(children: [
                    Container(
                        width: 150,
                        height: 45,
                        child: MaskedTextField(
                          mask:"x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x",
                          maxLength: 54,
                          keyboardType: TextInputType.name,
                          maskedTextFieldController:
                              widget.transition!.transitionsText,
                          inputDecoration: InputDecoration(counterText: ""),
                        ))
                  ]),
                  Row(children: [
                    Container(
                        width: 150,
                        height: 50,
                        child: OutlinedButton(
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                Text(Language.delete,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Tittilium"))
                              ],
                            ),
                            onPressed: () {
                              widget.delete.call();
                              widget.update.call();
                            }))
                  ]),
                  Row(children: [
                    Container(
                        width: 150,
                        height: 50,
                        child: OutlinedButton(
                            child: Row(
                              children: [
                                Icon(Icons.save, color: Colors.green.shade400),
                                Text(Language.save,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: "Tittilium"))
                              ],
                            ),
                            onPressed: () {
                              widget.transition!.chars = widget.save.call(widget.transition!.transitionsText.text);
                              widget.update.call();
                            }))
                  ])
                ])));
  }
}
