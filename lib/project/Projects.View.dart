import 'package:estudio_automato/components/Alert.dart';
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
  bool showAlert = false;

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
                Colors.green.shade800,
                Colors.white,
                Colors.indigo.shade600
              ])),
          child: Column(children: [
            Alert(show:showAlert, text: 'Um AFD requer um estado inicial',type: AlertType.Info),
            Padding(
                padding: EdgeInsets.only(top: fivePercent()),
                child: Row(children: [
                  Padding(
                      padding: EdgeInsets.only(left: fivePercent() * 1.5),
                      child: MenuButton(
                        icon: Icons.hdr_auto_outlined,
                        fx: _rules.newFiniteDeterministicAutomaton(context),
                        label: Language.fnda,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: fivePercent()),
                      child: Column(children: [
                        MenuButton(
                          icon: Icons.hdr_strong_outlined,
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
                        icon: Icons.lock,
                        fx: null,
                        label: Language.stackFda,
                      )),
                  Padding(
                      padding: EdgeInsets.only(left: fivePercent()),
                      child: Column(children: [
                        MenuButton(
                          icon: Icons.lock,
                          fx: () =>{setState(()=>{
                            this.showAlert = !showAlert
                          })},
                          label: Language.grammar,
                        )
                      ])),
                ]))
          ])),
    ));
  }
}
