import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';

class Language {

  static LanguageEnum selected = LanguageEnum.English;
  static Image selectedIcon = Image.asset('icons/flags/png/gb.png', package: 'country_icons');
  static String title = "Automaton Studio";
  static String start = "Welcome !";

  static void changeLanguage(LanguageEnum language){
    
    switch (language){

      case LanguageEnum.Portuguese:
        title = "Estúdio Autômato";
        start = "Bem vindo !";
        
        Language.selectedIcon =  Image.asset('icons/flags/png/br.png', package: 'country_icons');
        selected = LanguageEnum.Portuguese;
      break;
      
      case LanguageEnum.English:
        title = "Automaton Studio";
        start = "Welcome !";

        selectedIcon =  Image.asset('icons/flags/png/gb.png', package: 'country_icons');
        selected = LanguageEnum.English;
      break;
    }
  }
}

enum LanguageEnum{
  Portuguese, English
}