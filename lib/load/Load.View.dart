import 'package:estudio_automato/components/MenuButton.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:estudio_automato/configurations/Themes.dart';
import 'package:estudio_automato/load/ProjectCard.Rules.dart';
import 'package:estudio_automato/utils/SaveSystem.dart';
import 'package:flutter/material.dart';

class LoadView extends StatefulWidget {
  const LoadView({Key? key}) : super(key: key);

  @override
  _LoadViewState createState() => _LoadViewState();
}

class _LoadViewState extends State<LoadView> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: AutomatonThemes.getBackground(),
      child: FutureBuilder(
          future: SaveSystem.getFiles(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<String>? files = snapshot.data as List<String>?;

              if (files!.isEmpty) {
                return Container();
              }
              return SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Column(children: getCards(files))));
            }
            return Container();
          }),
    ));
  }

  List<Widget> getCards(List<String> files) {
    List<Widget> cards = [];

    files.forEach((file) => cards.add(ProjectCard(filename: file, parentState: this)));

    return cards;
  }
}

class ProjectCard extends StatefulWidget {
  const ProjectCard({Key? key, required this.filename, required this.parentState}) : super(key: key);

  final String filename;
  final State parentState;

  @override
  ProjectCardState createState() => ProjectCardState();
}

class ProjectCardState extends State<ProjectCard> {
  Duration duration = Duration(milliseconds: 300);
  bool expanded = false;
  
  late ProjectCardRules rules;

  @override
  void initState() {
    rules = ProjectCardRules(parentState: widget.parentState);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.8;
    double height = expanded ? 250 : 80;
    String filenameWithoutExtension = widget.filename.split(".")[0];
    
    return InkWell(
        hoverColor: Colors.black,
        focusColor: Colors.black,
        highlightColor: Colors.blue,
        onTap: () => {
              setState(() => {expanded = !expanded})
            },
        child: AnimatedContainer(
          duration: duration,
          width: width,
          height: height,
          child: Card(
            color: Colors.green.shade100,
            elevation: 5,
            borderOnForeground: true,
            shadowColor: Colors.black,
            child: SingleChildScrollView(
              child: Column(children: [
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.03, right: width * 0.03),
                      child: Container(
                          child: Icon(Icons.hdr_auto_outlined, size: 70))),
                  VerticalDivider(color: Colors.black),
                  Flexible(
                      child: Text(filenameWithoutExtension,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: 25, fontFamily: "Tittilium")))
                ],
              ),
              expanded? Divider(color: Colors.black) : Container(),
              expanded ? Padding(
                padding: EdgeInsets.only(top:20),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MenuButton(icon: Icons.open_in_browser, fx: ()=>{}, label: Language.loadProject),
                  MenuButton(icon: Icons.delete, fx: ()=> rules.delete(filenameWithoutExtension), label: Language.delete)
                ]
              )
              ):Container() 
            ])
            ),
          ),
        ));
  }
}
