import 'dart:async';

import 'package:flutter/cupertino.dart';

import 'Projects.View.dart';

class ProjectsRules {
  

  bool showAlert = false;
  String text = '';
  Timer? timer;
  
  Function newFiniteDeterministicAutomaton(BuildContext context){
    return () =>  Navigator.pushNamed(context, '/fda');
  }
  
  Function alertTimer(State<ProjectsView> state){
    return (){

      if(timer != null && timer!.isActive){
        timer!.cancel();
      }

      timer = Timer(Duration(seconds:5), (){
        state.setState(() {
          showAlert = false;
        });
      });
      
    };
  }
}