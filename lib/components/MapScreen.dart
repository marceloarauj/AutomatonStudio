import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MapScreen extends StatefulWidget {
  MapScreen({Key? key, required this.child, required this.axis, required this.updateViewParent})
      : super(key: key);

  final Widget child;
  final Function axis;
  final Function updateViewParent;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TransformationController _transformator = TransformationController();
  double sizeC = 100000;

  updateContainer() {
    //_transformator.value = Matrix4.identity()..translate(50000.0, 50000.0); go to center inicial
    double x = _transformator.value.getTranslation().x;
    double y = _transformator.value.getTranslation().y;

    widget.axis(x, y);
  }

  @override
  void initState() {
    _transformator.addListener(updateContainer);
    super.initState();
  }

  void interactionEnd(ScaleEndDetails details){
    widget.updateViewParent.call();
  }
  
  void interactionUpdate(ScaleUpdateDetails details){
    widget.updateViewParent.call();
  }

  void interactionStart(ScaleStartDetails details){
    widget.updateViewParent.call();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.9;
    double height = MediaQuery.of(context).size.height;

    return Material(
        child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
            ),
            child: InteractiveViewer(
                onInteractionEnd: interactionEnd,
                onInteractionUpdate: interactionUpdate,
                onInteractionStart: interactionStart,
                constrained: false,
                transformationController: _transformator,
                scaleEnabled: false,
                child: Container(
                    color: Colors.grey.shade900,
                    width: sizeC,
                    height: sizeC,
                    child: widget.child))));
  }
}
