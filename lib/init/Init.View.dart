import 'package:estudio_automato/components/MenuButton.dart';
import 'package:estudio_automato/configurations/Language.dart';
import 'package:estudio_automato/init/Init.Rules.dart';
import 'package:flutter/material.dart';

class InicioView extends StatefulWidget {
  InicioView({Key? key}) : super(key: key);

  @override
  _InicioView createState() => _InicioView();
}

class _InicioView extends State<InicioView> {
  InitRules _rules = InitRules();

  @override
  Widget build(BuildContext context) {
    double fivePercent() {
      return MediaQuery.of(context).size.height * 0.05;
    }

    return Scaffold(
        floatingActionButton: FloatingActionButton(
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
            child: Language.selectedIcon),
        body: Center(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 20),
                  child: Image.asset("assets/logo.png")),
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
                          icon: Icons.create_outlined,
                          fx: _rules.NewProject(context),
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: fivePercent()),
                        child: MenuButton(icon: Icons.folder_open_outlined)),
                  ])),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(left: fivePercent() * 1.5),
                        child: MenuButton(
                          icon: Icons.help_outline,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: fivePercent()),
                        child: MenuButton(
                            icon: Icons.exit_to_app, fx: _rules.closeApp())),
                  ]))
            ],
          ),
        )));
  }
}
