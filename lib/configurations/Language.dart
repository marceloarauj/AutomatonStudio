import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';

class Language {

  // options
  static LanguageEnum selected = LanguageEnum.English;
  static Image selectedIcon = Image.asset('icons/flags/png/gb.png', package: 'country_icons');
  static String newProject = "New Project";
  static String loadProject = "Open Project";
  static String help = "Guide";
  static String exit = "Exit";
  static String title = "Automaton Studio";
  static String start = "Welcome !";
  static String fda   = "New D.F.A";
  static String fnda  = "New N.F.D.A";
  static String stackFda = "New Stack Automaton";
  static String grammar = "New Grammar";
  static String success = "Success";
  static String rejected = "Rejected";
  static String waiting = "Waiting";

  //alerts
  static String alertGrammar = "Grammar unavaible";
  static String alertStackAutomaton = "Stack Automaton unavaible";

  // StateOptions
  static String initial = "initial";

  static void changeLanguage(LanguageEnum language){
    
    switch (language){

      case LanguageEnum.Portuguese:
        title = "Estúdio Autômato";
        start = "Bem vindo !";
        newProject = "Novo Projeto";
        loadProject = "Abrir Projeto";
        help = "Guia";
        exit = "Sair";
        fda   = "Novo A.F.D";
        fnda  = "Novo A.F.N.D";
        stackFda = "Novo Autômato com pilha";
        grammar = "Nova Gramática";
        alertGrammar = "Gramática indisponível";
        alertStackAutomaton = "Autômato com pilha indisponível";
        initial = "inicial";
        success = "Sucesso";
        rejected = "Rejeitado";
        waiting = "Aguardando";

        Language.selectedIcon =  Image.asset('icons/flags/png/br.png', package: 'country_icons');
        selected = LanguageEnum.Portuguese;
      break;
      
      case LanguageEnum.English:
        title = "Automaton Studio";
        start = "Welcome !";
        newProject = "New Project";
        loadProject = "Open Project";
        help = "Guide";
        exit = "Exit";
        fda   = "New D.F.A";
        fnda  = "New N.F.D.A";
        stackFda = "New Stack Automaton";
        grammar = "New Grammar";
        alertGrammar = "Grammar unavaible";
        alertStackAutomaton = "Stack Automaton unavaible";
        initial = "initial";
        success = "Success";
        rejected = "Rejected";
        waiting = "Waiting";

        selectedIcon =  Image.asset('icons/flags/png/gb.png', package: 'country_icons');
        selected = LanguageEnum.English;
      break;
    }
  }
}

enum LanguageEnum{
  Portuguese, English
}