import 'dart:io';

import 'package:flutter/material.dart';

class InitRules{

  Function NewProject(BuildContext context){
    return () => Navigator.pushNamed(context, '/projects');
  } 
  
  Function OpenProject(BuildContext context){
    return () => Navigator.pushNamed(context, '/load');
  }

  void OpenGuide(){

  }

  Function closeApp(){
    return ()=> exit(0);
  }

}