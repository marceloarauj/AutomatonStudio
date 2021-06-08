import 'package:flutter/material.dart';

import 'AutomatonState.dart';
class FdaRules{

  List<AutomatonState> stateList = [];
  ToolOption selectedTool = ToolOption.Cursor;
  
  Function setCursorTool(){return () => selectedTool = ToolOption.Cursor;}
  Function setStateTool(){return () => selectedTool = ToolOption.State;}
  Function setFinalStateTool(){return () => selectedTool = ToolOption.FinalState;}
  Function setTransitionTool(){return () => selectedTool = ToolOption.Transition;}
  
  void screenClick(TapDownDetails details) {
    double x = details.localPosition.dx;
    double y = details.localPosition.dy;
  }
  
}

enum ToolOption{
  Cursor, State, FinalState, Transition
}