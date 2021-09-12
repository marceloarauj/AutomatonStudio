import 'package:estudio_automato/configurations/Themes.dart';
import 'package:estudio_automato/utils/SaveSystem.dart';
import 'package:flutter/material.dart';

class LoadView extends StatefulWidget {
  const LoadView({ Key? key }) : super(key: key);

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
      child: FutureBuilder(future:SaveSystem.load("teste"),
                           builder: (context, snapshot){
                             if(snapshot.hasData){
                              //  List<String>? file = snapshot.data as List<String>?;

                              //  if(file!.isEmpty){
                              //    return Container();
                              //  }
                              //  return Text(file[0]);
                               return Text(snapshot.data as String);
                             }
                             return Container();
                           }),
    ));
  }
}