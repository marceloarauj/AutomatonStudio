import 'package:estudio_automato/components/Transition.dart';
import 'package:flutter/material.dart';

import 'AutomatonState.dart';
class FdaRules{
  
  List<AutomatonState> stateList = [];
  List<Transition> transitionList = [];
  ToolOption selectedTool = ToolOption.Cursor;
  double screenX = 0.0;
  double screenY = 0.0;
  int lastID = 0;

  //Funções do menu lateral
  Function setCursorTool(State state){return () => state.setState(() {
    selectedTool = ToolOption.Cursor;
  });}
    Function setStateTool(State state){return () => state.setState(() {
    selectedTool = ToolOption.State;
  });}
    Function setFinalStateTool(State state){return () => state.setState(() {
    selectedTool = ToolOption.FinalState;
  });}
    Function setTransitionTool(State state){return () => state.setState(() {
    selectedTool = ToolOption.Transition;
  });}

  void screenClick(TapDownDetails details) {
    double x = details.localPosition.dx;
    double y = details.localPosition.dy;

    switch (selectedTool) {
      case ToolOption.Cursor:
        break;
      case ToolOption.State:
        newState(x,y);
        break;
      case ToolOption.FinalState:
        newState(x, y);
    }
  }
  
  bool disableSelectedButton(ToolOption option){
    return selectedTool == option;
  }

  void newState(double x, double y){
    AutomatonState state = AutomatonState();
    
     if(collides(x, y))
       return ;

    if(stateList.length == 0)
      state.makeInitial();

    if(selectedTool == ToolOption.FinalState)
      state.makeFinal();

    state.posX = x - 25 - screenX;
    state.posY = y - 25 - screenY;
    
    lastID = lastID + 1;
    state.ID = lastID;

    stateList.add(state);

    //teste
    if(stateList.length >= 2){
      AutomatonState from = stateList[stateList.length - 2];
      AutomatonState to = stateList[stateList.length - 1];

      Transition transition = Transition(from.posX,from.posY,to.posX,to.posY,from.ID,to.ID);
      transition.chars = ["t","e","s","t","e"];
      transitionList.add(transition);
    }
  }

  bool collides(double x,double y){
    for (var item in stateList) {

      if((item.posX <=  x && x <= item.posX + 50) && (item.posY <= y && y <= item.posY + 50))
        return true;

    }
    return false;
  }

  bool canExecute(){
    return false;
  }

  Function execute(String entrance){
    return (){

      if(stateList.isEmpty)
        return false;

      AutomatonState initial = stateList.where((element) => element.initialState == true).first;
      AutomatonState actualState = initial;
      List<Transition> transitions = transitionList.where((element) => element.fromID == actualState.ID).toList();

      if(transitions == null || transitions.isEmpty){
        return false;
      }

      bool accept = recursiveTransition(entrance,actualState);
      
      return accept;
    };
  }

  bool recursiveTransition(String entrance,AutomatonState actualState){
      String actualChar = entrance[0];
      print(actualChar); print(actualState.ID);
      entrance = entrance.substring(1);
      bool transitioned = false;
      List<Transition> transitions = transitionList.where((element) => element.fromID == actualState.ID).toList();
      
      for (Transition transition in transitions) {
        List<String> chars = transition.chars;

        for (String char in chars) {
            if(char == actualChar){
              actualState = stateList.where((element) => element.ID == transition.toID).first;
              transitions = transitionList.where((element) => element.fromID == actualState.ID).toList();
              transitioned = true;
              break;
            }
        }
        if(transitioned)
          break;
      }
      return transitioned && entrance.length > 0 ? 
                recursiveTransition(entrance, actualState) : (entrance.length == 0 && actualState.finalState);
  }
}

enum ToolOption{
  Cursor, State, FinalState, Transition
}