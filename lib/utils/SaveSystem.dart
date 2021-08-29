import 'dart:io';

import 'package:estudio_automato/FDA/AutomatonState.dart';
import 'package:estudio_automato/components/Transition.dart';
import 'package:path_provider/path_provider.dart';

class SaveSystem{

  static Future<String> getPath() async{

    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> getFile(String filename) async{
    
    final path = await getPath();
    
    return File('$path/$filename.json');
  }

  static void SaveFDA(String filename, List<AutomatonState> states, List<Transition> transitions) async {
    
    String path = await getPath();
    File file = await getFile(filename);

    //states
    file.writeAsString("{");
    file.writeAsString("/n/t");
    file.writeAsString('\"States:[\"');

    for (AutomatonState state in states) {
      file.writeAsString("/n/t/t{");
      file.writeAsString("/n/t/t/tid:${state.ID}");
      file.writeAsString("/n/t/t}");
    }

    file.writeAsString('],');

    //transitions
    //file.writeAsString("}");
  }

  void SaveNFDA(){

  }

  void load(){

  }

}
