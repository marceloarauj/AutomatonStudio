import 'package:estudio_automato/FDA/AutomatonState.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';

class StateOptions extends StatefulWidget {
  StateOptions({ Key? key
                 ,this.state
                 ,required this.update }) : super(key: key);

  AutomatonState? state;
  Function() update;

  @override
  _StateOptionsState createState() => _StateOptionsState();
}

class _StateOptionsState extends State<StateOptions> {

  @override
  Widget build(BuildContext context) {
    return widget.state == null? 
      Container():
      Transform(
          transform: Matrix4.translationValues(widget.state!.posX + 60, widget.state!.posY, 0),
          child: Container(
                          width: 100,
                          child: Row(
                            children: [
                              Column(children: [
                                Checkbox(value: widget.state!.initialState, onChanged: (value) {
                                    widget.state!.initialState = value == null ?  widget.state!.initialState : value ;
                                    widget.update();
                                }),
                                Text(Language.initial),
                              ]),
                              Column(children: [
                                Checkbox(value: widget.state!.finalState, onChanged: (value){
                                    widget.state!.finalState = value == null ?  widget.state!.finalState : value ;
                                    widget.update();
                                }),
                                Text("final"),
                              ])
                            ]
                          ))
      );
  }
}