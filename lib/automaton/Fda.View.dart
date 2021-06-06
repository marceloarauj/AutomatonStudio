import 'package:estudio_automato/components/MapScreen.dart';
import 'package:estudio_automato/components/ToolElement.dart';
import 'package:estudio_automato/components/Tools.dart';
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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(child: Row(
      children: [
        Tools(options:fdaTools()),
        MapScreen()
      ],
    ));
  }

  List<ToolElement> fdaTools(){
    List<ToolElement> tools = [];
    
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));
    tools.add(new ToolElement(icon: Icons.touch_app,));

    return tools;
  }
}