import 'package:flutter/material.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({ Key? key }) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
              width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
            Colors.white,
            Colors.purple.shade200,
            Colors.lightBlueAccent.shade700
          ])),
          child: Text("a")
      ),
    );
  }
}