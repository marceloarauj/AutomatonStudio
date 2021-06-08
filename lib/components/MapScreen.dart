import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TransformationController _transformator = TransformationController();

  double getX(){
    return _transformator.value.getTranslation().x;
  }

  double getY(){
    return _transformator.value.getTranslation().y;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
      ),
      child: InteractiveViewer(
        constrained: false,
          transformationController: _transformator,
          boundaryMargin: const EdgeInsets.all(900),
          scaleEnabled: false,
          child: Container(width: 100,height: 100,child: Column(children: [
            OutlinedButton(onPressed: () { setState(() {
            }); },
            child: Text("att"),),
            Text(_transformator.value.getTranslation().x.toString())
          ],),color: Colors.red,))
    )
    );
  }
}
