import 'package:flutter/cupertino.dart';

class ProjectsRules {
  
  Function newFiniteDeterministicAutomaton(BuildContext context){
    return () =>  Navigator.pushNamed(context, '/fda');
  }
  
}