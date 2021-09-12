import 'package:estudio_automato/components/MenuButton.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:estudio_automato/configurations/Themes.dart';
import 'package:estudio_automato/init/Init.Rules.dart';
import 'package:flutter/material.dart';

class InicioView extends StatefulWidget {
  InicioView({Key? key}) : super(key: key);

  @override
  _InicioView createState() => _InicioView();
}

class _InicioView extends State<InicioView> {
  InitRules _rules = InitRules();

  double fivePercent() {
    return MediaQuery.of(context).size.height * 0.05;
  }

  FloatingActionButton floatingButton(){
    return FloatingActionButton(
            backgroundColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (Language.selected == LanguageEnum.Portuguese) {
                  Language.changeLanguage(LanguageEnum.English);
                } else {
                  Language.changeLanguage(LanguageEnum.Portuguese);
                }
              });
            },
            child: Language.selectedIcon);
  }

  @override
  Widget build(BuildContext context){
    Image logo = Image.asset("assets/logo.png");
    
    return Scaffold(
        floatingActionButton: floatingButton(),
        body: Center(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: AutomatonThemes.getBackground(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: logo),
              Text(
                Language.title,
                style: TextStyle(fontSize: 30, fontFamily: "Tittilium"),
              ),
              Text(
                Language.start,
                style: TextStyle(fontSize: 20, fontFamily: "Tittilium"),
              ),
              Padding(
                  padding: EdgeInsets.only(top: fivePercent()),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(left: fivePercent() * 1.5),
                        child: MenuButton(
                          icon: Icons.app_registration,
                          fx: _rules.NewProject(context),
                          label: Language.newProject,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: fivePercent()),
                        child: MenuButton(
                          icon: Icons.folder_open_outlined,
                          fx: _rules.OpenProject(context),
                          label: Language.loadProject)),
                  ])),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(left: fivePercent() * 1.5),
                        child: MenuButton(
                          icon: Icons.help_outline,
                          label: Language.help
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: fivePercent()),
                        child: MenuButton(
                            label: Language.exit,
                            icon: Icons.exit_to_app, fx: _rules.closeApp())),
                  ]))
            ],
          ),
        )));
  }
}
