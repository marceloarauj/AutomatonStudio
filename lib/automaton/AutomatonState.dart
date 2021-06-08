import 'package:flutter/material.dart';

class AutomatonState{

  String? label;
  bool initialState = false;
  bool finalState = false;
  Image stateImage = Image.asset("assets/normal_state.png");
  double posX = 0.0;
  double posY = 0.0;
  double relativePosX = 0.0;
  double relativePosY = 0.0;

  makeInitial(){
    this.initialState = true;
    stateImage = Image.asset("assets/initial_state.png");
  }
  makeFinal(){
    this.finalState = true;
    stateImage = Image.asset("assets/final_state.png");
  }
  makeNormal(){
    initialState = false;
    finalState = false;
    stateImage = Image.asset("assets/normal_state.png");
  }
}

class Transition{
  List<String>? transitionFlags;
  State? fromState;
  State? toState;
}