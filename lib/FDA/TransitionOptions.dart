import 'package:estudio_automato/components/Transition.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';

class TransitionOptions extends StatefulWidget {
  TransitionOptions({ Key? key, 
                      this.transition, 
                      required this.delete, 
                      required this.update }) : super(key: key);

  Transition? transition;
  Function() update;
  Function() delete;

  @override
  _TransitionOptionsState createState() => _TransitionOptionsState();
}

class _TransitionOptionsState extends State<TransitionOptions> {

  @override
  Widget build(BuildContext context) {
    return widget.transition == null? Container():
           Transform(
            transform: Matrix4.translationValues(
                widget.transition!.fromX + 60, widget.transition!.fromY, 0),
            child: Container(
                width: 120,
                height: 145,
                color: Colors.grey.shade100,
                child: Column(children: [
                    Row(children: [
                      Container(
                          width: 120,
                          child: OutlinedButton(
                              child: Row(
                                children: [
                                  Icon(Icons.delete,color: Colors.red),
                                  Text(Language.delete,
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 20, fontFamily: "Tittilium"))
                                ],
                              ),
                              onPressed: ()  {
                                widget.delete.call();
                                widget.update.call();
                                }))
                  ])
                ])));
  }
}