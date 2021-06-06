import 'package:estudio_automato/components/ToolElement.dart';
import 'package:flutter/material.dart';

class Tools extends StatefulWidget {
  const Tools({Key? key, required this.options}) : super(key: key);

  final List<ToolElement> options;

  @override
  _ToolsState createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
     
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
        child: Container(
      color: Colors.white,
      width: width * 0.10,
      child: Column(
        children: [
          Container(
            width: width * 0.10,
            height: height * 0.1,
            child: OutlinedButton(
              onPressed: () => {},
              child: Icon(Icons.keyboard_arrow_up),
            ),
          ),
          Container(height: height * 0.6,child: ListView(
            controller: scrollController,
            children: widget.options,
          )),
          Container(
              width: width * 0.10,
              height: height * 0.1,
              child: OutlinedButton(
                onPressed: () => {},
                child: Icon(Icons.keyboard_arrow_down),
              )),
          Container(
              width: width * 0.10,
              height: height * 0.1,
              child: OutlinedButton(
                onPressed: () => {},
                child: Icon(Icons.double_arrow, color: Colors.green.shade600),
              )),
          Container(
              width: width * 0.10,
              height: height * 0.1,
              child: OutlinedButton(
                onPressed: () => {},
                child: Icon(Icons.stop, color: Colors.red.shade400),
              ))
        ],
      ),
    ));
  }
}
