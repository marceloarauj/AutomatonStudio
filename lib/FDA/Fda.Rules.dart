import 'package:estudio_automato/components/Transition.dart';
import 'package:estudio_automato/utils/SaveSystem.dart';
import 'package:flutter/material.dart';

import 'AutomatonState.dart';
class FdaRules{
  
  List<AutomatonState> stateList = [];
  List<Transition> transitionList = [];
  ToolOption selectedTool = ToolOption.Cursor;
  double screenX = 0.0;
  double screenY = 0.0;
  int lastID = 0;
  bool executionModalVisible = false;
  AutomatonState? stateFocus;
  Transition? transitionFocus;
  Function? updateState;

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
        selectCursor(x,y);
        break;
      case ToolOption.Transition:
        makeTransition(x,y);
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
  }

  void makeTransition(double x, double y) {
    if(stateFocus == null){
      stateFocus = collidesState(x, y);
      stateFocus!.alterFocus(true);

    }else{
      AutomatonState? nextState = collidesState(x, y);
      if(nextState != null){

        Transition transition = Transition(stateFocus!.posX
                                           ,stateFocus!.posY
                                           ,nextState.posX
                                           ,nextState.posY
                                           ,stateFocus!.ID
                                           ,nextState.ID
                                           );        

        transitionList.add(transition);
        stateFocus!.alterFocus(false);
        stateFocus = null;
      }
    }
  }

  void selectCursor(double x, double y){
    stateFocus = collidesState(x,y);

    if(stateFocus != null){
      for(AutomatonState state in stateList){
        if(state.ID != stateFocus!.ID){
          state.alterFocus(false);
        }
      }
      
      if(transitionFocus != null){
        transitionFocus!.alterFocus(false);
        transitionFocus = null;
      }

      stateFocus!.alterFocus(true);

    }else{
      for(AutomatonState state in stateList){
        state.alterFocus(false);
      }
      if(transitionFocus != null){
        transitionFocus!.alterFocus(false);
        transitionFocus = null;
      }
    }
    
    transitionFocus = collidesTransition(x, y);
   
    if(transitionFocus != null){
      transitionFocus!.alterFocus(true);
    }

  }

  AutomatonState? stateOptions(){
    if(selectedTool == ToolOption.Cursor)
      return stateFocus;

    return null;
  }

  Transition? transitionOptions(){
    if(selectedTool == ToolOption.Cursor)
      return transitionFocus;
    
    return null;
  }

  bool collides(double x,double y){
    for (var item in stateList) {

      if((item.posX <=  x && x <= item.posX + 50) && (item.posY <= y && y <= item.posY + 50))
        return true;

    }
    return false;
  }

  AutomatonState? collidesState(double x,double y){
    x = x - screenX;
    y = y - screenY;
    for (var item in stateList) {

      if((item.posX <=  x && x <= item.posX + 50) && (item.posY <= y && y <= item.posY + 50))
        return item;

    }
    return null;
  }

  Transition? collidesTransition(double x, double y){
    x = x - screenX;
    y = y - screenY;

    for(var transition in transitionList){
      TransitionView tv = TransitionView(transition: transition);

      if(tv.hitTest(Offset(x, y)))
        return transition;

    }

    return null;
  }

  bool canExecute(){
    return false;
  }

  deleteState(){
    transitionList.removeWhere((element) => (element.fromID == stateFocus!.ID || element.toID == stateFocus!.ID));
    stateList.removeWhere((element) => element.ID == stateFocus!.ID);
    stateFocus = null;
  }

  deleteTransition(){
    transitionList.removeWhere((element) => (element.fromID == transitionFocus!.fromID && element.toID == transitionFocus!.toID));
    transitionFocus = null;
  }

  List<String> saveTransition(String transition){
    transition = transition.toLowerCase();
    transition = transition.replaceAll(RegExp(r'[^\w\s]+'), '');
    transition = transition.replaceAll(RegExp(r'[0-9]'), '');
    List<String> chars = transition.split("");
    chars = chars.toSet().toList();

    return chars;
  }

  changeModalExecutionVisibility(){
    this.executionModalVisible = !this.executionModalVisible;
    this.updateState!.call();
  }

  Function execute(String entrance){
    return () {
      
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
                recursiveTransition(entrance, actualState) : (transitioned && entrance.length == 0 && actualState.finalState);
  }

  
}

enum ToolOption{
  Cursor, State, FinalState, Transition
}