class State{

  String? label;
  bool initialState = false;
  bool finalState = false;

}

class Transition{
  String? flag;
  State? fromState;
  State? toState;
}