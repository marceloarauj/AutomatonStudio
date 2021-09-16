import 'package:estudio_automato/FDA/AutomatonState.dart';
import 'package:estudio_automato/FDA/Fda.Rules.dart';
import 'package:estudio_automato/FDA/StateOptions.dart';
import 'package:estudio_automato/FDA/TransitionOptions.dart';
import 'package:estudio_automato/components/Alert.dart';
import 'package:estudio_automato/modals/ExecutionModal.dart';
import 'package:estudio_automato/components/MapScreen.dart';
import 'package:estudio_automato/components/ToolElement.dart';
import 'package:estudio_automato/components/Tools.dart';
import 'package:estudio_automato/components/Transition.dart';
import 'package:estudio_automato/modals/SaveModal.dart';
import 'package:estudio_automato/utils/SaveSystem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FdaView extends StatefulWidget {
  const FdaView({Key? key}) : super(key: key);

  @override
  _FdaViewState createState() => _FdaViewState();
}

class _FdaViewState extends State<FdaView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    rules.updateState = updateState;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.dispose();
  }

  FdaRules rules = FdaRules();

  updateAxis(double x, double y) {
    rules.screenX = x;
    rules.screenY = y;
    updateState();
  }

  updateState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return Container(
        child: Row(
      children: [
        Tools(
            executionModalVisibility: rules.changeModalExecutionVisibility,
            options: fdaTools(rules)),
        GestureDetector(
          child: MapScreen(
              child: Map(), axis: updateAxis, updateViewParent: updateState),
          onTapDown: (TapDownDetails details) =>
              {rules.screenClick(details), updateState()},
        )
      ],
    ));
  }

  Widget Map() {
    List<Widget> children = [];

    children.add(Transform(
        transform: Matrix4.translationValues((-rules.screenX) ,(-rules.screenY), 0),
        child:Alert(type: rules.alertType, 
                text: rules.alertText, 
                show: rules.showAlert, 
                alertCallback: rules.alertTimer(this), 
                width: MediaQuery.of(context).size.width * 0.9, 
                height: MediaQuery.of(context).size.height)));

    //States
    for (int x = 0; x < rules.stateList.length; x++) {
      AutomatonState state = rules.stateList[x];

      children.add(Transform(
          transform: Matrix4.translationValues(state.posX, state.posY, 0),
          child: Container(child: state.stateImage)));
    }

    //Transitions
    for (int x = 0; x < rules.transitionList.length; x++) {
      children.add(CustomPaint(
        painter: TransitionView(transition: rules.transitionList[x]),
      ));
    }

    //State options
    children.add(new StateOptions(
        state: rules.stateOptions(),
        update: updateState,
        delete: rules.deleteState,
        rules: rules));

    //Transition options
    children.add(new TransitionOptions(
        transition: rules.transitionOptions(),
        delete: rules.deleteTransition,
        save: rules.saveTransition,
        update: updateState));

    //Execution Modal
    children.add(Transform(
        transform: Matrix4.translationValues(
            100 + (-rules.screenX), 20 + (-rules.screenY), 0),
        child: ExecutionModal(
            closeFunction: rules.changeModalExecutionVisibility,
            visible: rules.executionModalVisible,
            executeFunction: rules.execute,
            screenWidth: MediaQuery.of(context).size.width * 0.9,
            screenHeight: MediaQuery.of(context).size.height)));

    //Save Modal
    children.add(
        Transform(
                transform: Matrix4.translationValues(
                    100 + (-rules.screenX), 20 + (-rules.screenY), 0),
                child: SaveModal(screenWidth: MediaQuery.of(context).size.width * 0.9, 
                                 screenHeight: MediaQuery.of(context).size.height, 
                                 visible: rules.showSave, 
                                 filename: rules.filename,
                                 close: rules.changeModalExecutionVisibility,
                                 save: rules.changeModalExecutionVisibility))
    );

    //Save widget configurations
    var positionSaveWidth = (MediaQuery.of(context).size.width * 0.9) - 100;
    var positionSaveHeight = MediaQuery.of(context).size.height - 80;
    children.add(Transform(
        transform: Matrix4.translationValues(positionSaveWidth + (-rules.screenX) , positionSaveHeight + (-rules.screenY), 0),
        child: RawMaterialButton(
          onPressed: ()=> SaveSystem.SaveFDA("teste", rules.stateList, rules.transitionList),
          elevation: 2.0,
          fillColor: Colors.grey.shade200,
          child: Icon(
            Icons.save,
            size: 35.0,
            color: Colors.green.shade700,
          ),
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
        )));

    return Stack(children: children);
  }

  List<ToolElement> fdaTools(FdaRules rules) {
    List<ToolElement> tools = [];

    tools.add(new ToolElement(
        imageIcon: Image.asset("assets/cursor.png"),
        fx: rules.setCursorTool(this),
        selected: !rules.disableSelectedButton(ToolOption.Cursor)));
    tools.add(new ToolElement(
        imageIcon: Image.asset("assets/normal_state.png"),
        fx: rules.setStateTool(this),
        selected: !rules.disableSelectedButton(ToolOption.State)));
    tools.add(new ToolElement(
        imageIcon: Image.asset("assets/final_state.png"),
        fx: rules.setFinalStateTool(this),
        selected: !rules.disableSelectedButton(ToolOption.FinalState)));
    tools.add(new ToolElement(
        imageIcon: Image.asset("assets/transition.png"),
        fx: rules.setTransitionTool(this),
        selected: !rules.disableSelectedButton(ToolOption.Transition)));

    return tools;
  }
}
