import 'package:estudio_automato/automaton/Fda.Rules.dart';
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

    FdaRules rules = FdaRules();
    
    return Container(child: Row(
      children: [
        Tools(options:fdaTools(rules)),
        GestureDetector(
          child: MapScreen(),
          onTapDown: rules.screenClick
        )
      ],
    ));
  }

  List<ToolElement> fdaTools(FdaRules rules){
    List<ToolElement> tools = [];
    
    tools.add(new ToolElement(imageIcon: Image.asset("assets/cursor.png"), fx: rules.setCursorTool()));
    tools.add(new ToolElement(imageIcon: Image.asset("assets/normal_state.png"),fx:rules.setStateTool()));
    tools.add(new ToolElement(imageIcon: Image.asset("assets/final_state.png"), fx:rules.setFinalStateTool()));
    tools.add(new ToolElement(imageIcon: Image.asset("assets/transition.png"), fx: rules.setTransitionTool()));

    return tools;
  }
}