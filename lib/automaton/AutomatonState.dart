class State{

  String? label;
  bool initialState = false;
  bool finalState = false;

}

class Transition{
  List<String>? transitionFlags;
  State? fromState;
  State? toState;
}