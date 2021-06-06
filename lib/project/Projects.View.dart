import 'package:estudio_automato/components/MenuButton.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:estudio_automato/project/Projects.Rules.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProjectsView extends StatefulWidget {
  const ProjectsView({Key? key}) : super(key: key);

  @override
  _ProjectsViewState createState() => _ProjectsViewState();
}

class _ProjectsViewState extends State<ProjectsView> {
  double fivePercent() {
    return MediaQuery.of(context).size.height * 0.05;
  }

  ProjectsRules _rules = ProjectsRules();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
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
          child: Column(children: [
            Padding(
                padding: EdgeInsets.only(top: fivePercent()),
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(left: fivePercent() * 1.5),
                      child: MenuButton(
                        icon: Icons.create_outlined,
                        fx: _rules.newFiniteDeterministicAutomaton(context),
                        label: Language.fnda,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: fivePercent()),
                      child: Column(children: [
                        MenuButton(
                          icon: Icons.folder_open_outlined,
                          fx: _rules.newFiniteDeterministicAutomaton(context),
                          label: Language.fda,
                        )
                      ])),
                ])),
            Padding(
                padding: EdgeInsets.only(top: fivePercent()),
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(left: fivePercent() * 1.5),
                      child: MenuButton(
                        icon: Icons.create_outlined,
                        fx: _rules.newFiniteDeterministicAutomaton(context),
                        label: Language.stackFda,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: fivePercent()),
                      child: Column(children: [
                        MenuButton(
                          icon: Icons.folder_open_outlined,
                          fx: _rules.newFiniteDeterministicAutomaton(context),
                          label: Language.grammar,
                        )
                      ])),
                ]))
          ])),
    ));
  }
}
