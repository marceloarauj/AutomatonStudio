import 'package:estudio_automato/components/MapScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FdaView extends StatefulWidget {
  const FdaView({ Key? key }) : super(key: key);

  @override
  _FdaViewState createState() => _FdaViewState();
}

class _FdaViewState extends State<FdaView> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return MapScreen();
  }
}