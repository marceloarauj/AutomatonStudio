import 'dart:io';

import 'package:flutter/material.dart';

class InitRules{

  Function NewProject(BuildContext context){
    return () => Navigator.pushNamed(context, '/projects');
  } 
  
  void OpenProject(){

  }

  void OpenGuide(){

  }

  Function closeApp(){
    return ()=> exit(0);
  }

}