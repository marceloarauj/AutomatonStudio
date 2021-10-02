import 'package:estudio_automato/load/Load.View.dart';
import 'package:estudio_automato/utils/SaveSystem.dart';
import 'package:flutter/material.dart';

class ProjectCardRules{

  State parentState;
  bool modalVisible = false;

  ProjectCardRules({required this.parentState});

  void openModal(){
    parentState.setState(() {
      modalVisible = true;
    });
  }

  void delete(String filename) {

    parentState.setState(() {
      SaveSystem.delete(filename);
      modalVisible = false;
    });
  }

  void cancelAction(){
    parentState.setState(() {
      modalVisible = false;
    });
  }

  void openProject(){
    
  }
}