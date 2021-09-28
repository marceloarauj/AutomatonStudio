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
      child: FutureBuilder(future:SaveSystem.getFiles(),
                           builder: (context, snapshot){
                             if(snapshot.hasData){
                               List<String>? files = snapshot.data as List<String>?;

                               if(files!.isEmpty){
                                 return Container();
                               }
                               return SingleChildScrollView(
                                 child: Column(
                                 children: getCards(files)
                                )
                               );
                             }
                             return Container();
                           }),
    ));
  }

  List<Widget> getCards(List<String> files){
    List<Widget> cards = [];

    files.forEach((element) => cards.add(ProjectCard(element)));

    return cards;
  }

  Widget ProjectCard(String title) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = 100;

    return Container(
      width: width,
      height: height,
      child: Card(
        elevation: 5,
        shadowColor: Colors.grey.shade300,
        child: Text(title),
      ),
    );
  }
}