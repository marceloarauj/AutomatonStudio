import 'dart:io';

import 'package:estudio_automato/FDA/AutomatonState.dart';
import 'package:estudio_automato/components/Transition.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class SaveSystem{

  static Future<String> getPath() async{

    final directory = await getApplicationDocumentsDirectory();

    final projectsFolder = Directory("${directory.path}/projects");

    if(await projectsFolder.exists()){
      return projectsFolder.path;

    }else{

      await projectsFolder.create();
      return projectsFolder.path;
    }

  }

  static Future<File> getFile(String filename) async{
    
    final path = await getPath();
    
    return File('$path/$filename.json');
  }

  static void Save(String filename, List<AutomatonState> states, List<Transition> transitions, String type) async {
    
    File file = await getFile(filename);
    StringBuffer sb = StringBuffer();
    
    //states
    sb.write("{");
    sb.write("\n\t\t\t");
    sb.write("\"Type\":" + "\"${type}\",");
    sb.write("\n\t\t\t");
    sb.write('\"States\":[');

    for (int i = 0; i < states.length; i++) {
      sb.write("\n\t\t\t\t\t{");
      sb.write("\n\t\t\t\t\t\t\t\t\tid:${states[i].ID},");
      sb.write("\n\t\t\t\t\t\t\t\t\tinitialState:${states[i].initialState},");
      sb.write("\n\t\t\t\t\t\t\t\t\tfinalState:${states[i].finalState},");
      sb.write("\n\t\t\t\t\t\t\t\t\tposX:${states[i].posX},");
      sb.write("\n\t\t\t\t\t\t\t\t\tposY:${states[i].posY}");
      sb.write("\n\t\t\t\t\t}");

      if(i != states.length - 1)
        sb.write(",");
    }

    sb.write('\n\t\t\t],');

    //transitions
    sb.write("\n\t\t\t");
    sb.write('\"Transitions\":[');

    for (int i =0; i < transitions.length; i++) {
      sb.write("\n\t\t\t\t\t{");
      sb.write("\n\t\t\t\t\t\tfromID:${transitions[i].fromID},");
      sb.write("\n\t\t\t\t\t\ttoID:${transitions[i].toID},");
      sb.write("\n\t\t\t\t\t\tfromX:${transitions[i].fromX},");
      sb.write("\n\t\t\t\t\t\tfromY:${transitions[i].fromY},");
      sb.write("\n\t\t\t\t\t\ttoX:${transitions[i].toX},");
      sb.write("\n\t\t\t\t\t\ttoY:${transitions[i].toY},");

      sb.write("\n\t\t\t\t\t\tchars:[ ");
      for(int j =0; j < transitions[i].chars.length; j++){
        sb.write(transitions[i].chars[j]);

        if(j != transitions[i].chars.length - 1)
          sb.write(",");
      }
      sb.write(" ]");

      sb.write("\n\t\t\t\t\t}");

      if(i != transitions.length - 1)
        sb.write(",");
    }
    sb.write('\n\t\t\t]');
    //eof
    sb.write("\n}");
    file.writeAsString(sb.toString());
  }

  static Future<String> load(String filename) async{
    
    File file = await getFile(filename);
    
    return await file.readAsString();
  }

  static void delete(filename) async{
    var file = await getFile(filename);

    file.delete();
  }

  static Future<List<String>> getFiles() async{
    final path = await getPath();
    
    List<String> files = [];

    for (var file in Directory(path).listSync()){
      
      files.add(basename(file.path));
    }
    
    return files;
  }

}
