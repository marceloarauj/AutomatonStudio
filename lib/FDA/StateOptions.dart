import 'package:estudio_automato/FDA/AutomatonState.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';

class StateOptions extends StatefulWidget {
  StateOptions({Key? key, 
                this.state, 
                required this.update,
                required this.delete}) : super(key: key);

  AutomatonState? state;
  Function() update;
  Function() delete;

  @override
  _StateOptionsState createState() => _StateOptionsState();
}

class _StateOptionsState extends State<StateOptions> {
  @override
  Widget build(BuildContext context) {
    return widget.state == null
        ? Container()
        : Transform(
            transform: Matrix4.translationValues(
                widget.state!.posX + 60, widget.state!.posY, 0),
            child: Container(
                width: 120,
                height: 145,
                color: Colors.grey.shade100,
                child: Column(children: [
                  Row(children: [
                    Checkbox(
                        value: widget.state!.initialState,
                        onChanged: (value) {
                          widget.state!.initialState = value == null
                              ? widget.state!.initialState
                              : value;
                          widget.update.call();
                        }),
                    Text(Language.initial,
                        style:
                            TextStyle(fontSize: 22, fontFamily: "Tittilium")),
                  ]),
                  Row(children: [
                    Checkbox(
                        value: widget.state!.finalState,
                        onChanged: (value) {
                          widget.state!.finalState =
                              value == null ? widget.state!.finalState : value;
                          widget.update.call();
                        }),
                    Text("Final",
                        style:
                            TextStyle(fontSize: 22, fontFamily: "Tittilium")),
                  ]),
                  Row(children: [
                    Container(
                        width: 120,
                        child: OutlinedButton(
                            child: Row(
                              children: [
                                Icon(Icons.delete,color: Colors.red),
                                Text(Language.delete,
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 22, fontFamily: "Tittilium"))
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
