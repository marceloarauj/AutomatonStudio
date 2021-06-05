import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  TransformationController _transformator = TransformationController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(230, 230, 230, 1),
      ),
      child: InteractiveViewer(
        constrained: false,
          transformationController: _transformator,
          boundaryMargin: const EdgeInsets.all(900),
          scaleEnabled: false,
          child: Container(width: 100,height: 100,child: Text("AAAA"),color: Colors.red,))
    );
  }
}
