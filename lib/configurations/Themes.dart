import 'package:flutter/material.dart';

class AutomatonThemes {

  static BoxDecoration getBackground() {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
          Colors.green.shade800,
          Colors.white,
          Colors.indigo.shade600
        ]));
  }
  
}
