import 'package:flutter/material.dart';
class AutomatonState {
  
  String? label;
  bool initialState = false;
  bool finalState = false;
  Image stateImage = Image.asset("assets/normal_state.png");
  double posX = 0.0;
  double posY = 0.0;
  int ID = 0;
  bool focused = false;

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

  alterFocus(bool focus){
    focused = focus;

    if(!focused && !initialState && !finalState){
      stateImage = Image.asset("assets/normal_state.png");
    }
    else if(focused && !initialState && !finalState){
      stateImage = Image.asset("assets/normal_state_focused.png") ;
    }
    else if(!focused && initialState && !finalState){
      stateImage = Image.asset("assets/initial_state.png");
    }
    else if(focused && initialState && !finalState){
      stateImage = Image.asset("assets/initial_state_focused.png");
    }
    else if(!focused && !initialState && finalState){
      stateImage = Image.asset("assets/final_state.png");
    }
    else if(focused && !initialState && finalState){
      stateImage = Image.asset("assets/final_state_focused.png");
    }
  }
}
