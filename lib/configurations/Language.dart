import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';

class Language {

  static LanguageEnum selected = LanguageEnum.English;
  static Image selectedIcon = Image.asset('icons/flags/png/gb.png', package: 'country_icons');
  static String title = "Automaton Studio";
  static String start = "Welcome !";
  static String fda   = "New D.F.A";
  static String fnda  = "New N.F.D.A";
  static String stackFda = "New Stack Automaton";
  static String grammar = "New Grammar";

  static void changeLanguage(LanguageEnum language){
    
    switch (language){

      case LanguageEnum.Portuguese:
        title = "Estúdio Autômato";
        start = "Bem vindo !";
        fda   = "Novo A.F.D";
        fnda  = "Novo A.F.N.D";
        stackFda = "Novo Autômato com pilha";
        grammar = "Nova Gramática";

        Language.selectedIcon =  Image.asset('icons/flags/png/br.png', package: 'country_icons');
        selected = LanguageEnum.Portuguese;
      break;
      
      case LanguageEnum.English:
        title = "Automaton Studio";
        start = "Welcome !";
        fda   = "New D.F.A";
        fnda  = "New N.F.D.A";
        stackFda = "New Stack Automaton";
        grammar = "New Grammar";

        selectedIcon =  Image.asset('icons/flags/png/gb.png', package: 'country_icons');
        selected = LanguageEnum.English;
      break;
    }
  }
}

enum LanguageEnum{
  Portuguese, English
}