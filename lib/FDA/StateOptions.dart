import 'package:estudio_automato/FDA/AutomatonState.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:flutter/material.dart';

import 'Fda.Rules.dart';

class StateOptions extends StatefulWidget {
  StateOptions({Key? key, 
                this.state, 
                required this.update,
                required this.delete,
                required this.rules}) : super(key: key);

  AutomatonState? state;
  FdaRules rules;
  Function() update;
  Function() delete;

  @override
  _StateOptionsState createState() => _StateOptionsState();
}

class _StateOptionsState extends State<StateOptions> {

  void initialCheckboxChange(bool? value){

    if(value! == true){
      var initial = widget.rules.stateList.where((state) => state.initialState);

      if(!initial.isEmpty){

        for (var state in widget.rules.stateList) {
          state.initialState = false;
        }

      }
      widget.state!.initialState = value;

    }else{
      widget.state!.initialState = value;
    }

    widget.update.call();
  }

  TextEditingController labelController = TextEditingController();

  @override
  void initState() {

    labelController.addListener(() {
      widget.rules.updateLabel(labelController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    
    if(widget.state != null){
      labelController.text = widget.state!.label;
    }

    return widget.state == null
        ? Container()
        : Transform(
            transform: Matrix4.translationValues(
                widget.state!.posX + 60, widget.state!.posY, 0),
            child: Container(
                width: 150,
                height: 195,
                color: Colors.grey.shade100,
                child: Column(children: [
                  Container(child:
                    TextField(
                      textAlign: TextAlign.center,
                      controller: labelController,
                      maxLength: 7,
                      decoration: InputDecoration(
                        counterText: "",
                        hintText: "label"
                      )
                    )
                  ),
                  Row(children: [
                    Checkbox(
                        value: widget.state!.initialState,
                        onChanged: (value) => initialCheckboxChange(value)),
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
                            TextStyle(fontSize: 22, fontFamily: "Tittilium"))
                  ]),
                  Row(children: [
                    Container(
                        width: 150,
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
