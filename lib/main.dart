 // @dart=2.9
import 'package:estudio_automato/FDA/Fda.View.dart';
import 'package:estudio_automato/load/load.view.dart';
import 'package:estudio_automato/project/Projects.View.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'init/Init.View.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp(
      
      title: 'Automaton Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: "/",
      routes: {
        "/":          (context) => InicioView(),
        "/projects":  (context) => ProjectsView(),
        "/load":      (context) => LoadView(),
        "/fda":       (context) => FdaView()
      },
    );
  }
}
