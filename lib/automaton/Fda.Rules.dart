import 'package:flutter/material.dart';

import 'AutomatonState.dart';
class FdaRules{
  
  List<AutomatonState> stateList = [];
  ToolOption selectedTool = ToolOption.Cursor;
  double screenX = 0.0;
  double screenY = 0.0;
  
  //Funções do menu lateral
  Function setCursorTool(){return () => selectedTool = ToolOption.Cursor;}
  Function setStateTool(){return () => selectedTool = ToolOption.State;}
  Function setFinalStateTool(){return () => selectedTool = ToolOption.FinalState;}
  Function setTransitionTool(){return () => selectedTool = ToolOption.Transition;}
  

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
  
  void newState(double x, double y){
    AutomatonState state = AutomatonState();

    if(stateList.length == 0)
      state.makeInitial();

    if(selectedTool == ToolOption.FinalState)
      state.makeFinal();

    state.posX = x - 25 - screenX;
    state.posY = y - 25 - screenY;

    stateList.add(state);
  }
}

enum ToolOption{
  Cursor, State, FinalState, Transition
}