import 'dart:convert';
import 'dart:io';

import 'package:estudio_automato/load/Load.View.dart';
import 'package:estudio_automato/load/models/FiniteDeterministicModel.dart';
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

  openProject(String filename, BuildContext context) async{

    var projectData = await loadProjectData(filename);
      
    if(projectData.Type == 'FDA'){
      Navigator.pushNamed(context, '/fda', arguments: projectData);
    }
  }

  Future<FiniteDeterministicModel> loadProjectData(String filename) async{

    File file = await SaveSystem.getFile(filename);
    String jsonString = await file.readAsString();
    Map<String, dynamic> userMap = json.decode(jsonString);

    var modelProject = FiniteDeterministicModel.fromJson(userMap);

    return modelProject;
  }
}